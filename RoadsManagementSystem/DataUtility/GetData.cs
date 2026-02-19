using Npgsql;
using RoadsManagementSystem.DataUtility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace RoadsManagementSystem.DataUtility
{
    public class GetData
    {
        private SqlConnection conn;

        public GetData()
        {
            string connStr = ConfigurationManager
                .ConnectionStrings["connectionString"]
                .ConnectionString;

            conn = new SqlConnection(connStr);
        }

        // ---------------- SELECT ONE ROW ----------------
        public string[] SelectColumns(SqlCommand cmd)
        {
            DataTable data = new DataTable();

            try
            {
                using (SqlConnection connection = new SqlConnection(
                    ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString))
                {
                    connection.Open();

                    cmd.Connection = connection;
                    cmd.CommandTimeout = 30;

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(data);
                    }
                }
               
                if (data.Rows.Count == 0)
                    return new string[0];

                string[] col = new string[data.Columns.Count];

                for (int i = 0; i < col.Length; i++)
                    col[i] = data.Rows[0][i].ToString();

                return col;
            }
            catch (Exception ex)
            {
                throw new Exception("Database connection error: " + ex.Message);
            }
        }


        // ---------------- INSERT / UPDATE / DELETE ----------------
        public int UpdateData(SqlCommand cmd)
        {
            int rowsAffected = 0;

            if (conn.State == ConnectionState.Closed)
                conn.Open();

            foreach (SqlParameter param in cmd.Parameters)
            {
                if (param.Value == null)
                    param.Value = DBNull.Value;
            }

            cmd.Connection = conn;
            cmd.CommandTimeout = 30;

            rowsAffected = cmd.ExecuteNonQuery();

            conn.Close();

            return rowsAffected;
        }

        // ---------------- MULTIPLE COMMAND TRANSACTION ----------------
        public int SaveData(List<SqlCommand> cmdList)
        {
            int rowsAffected = 0;

            //if (conn.State == ConnectionState.Closed)
                conn.Open();

            SqlTransaction transaction = conn.BeginTransaction();

            try
            {
                foreach (SqlCommand cmd in cmdList)
                {
                    foreach (SqlParameter param in cmd.Parameters)
                    {
                        if (param.Value == null)
                            param.Value = DBNull.Value;
                    }

                    cmd.Connection = conn;
                    cmd.Transaction = transaction;
                    cmd.CommandTimeout = 30;

                    rowsAffected += cmd.ExecuteNonQuery();
                }

                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
                rowsAffected = 0;
                throw;
            }
            finally
            {
                conn.Close();
            }

            return rowsAffected;
        }

        // ---------------- GET DATATABLE ----------------
        public DataTable GetDataTable(SqlCommand cmd)
        {
            DataTable dt = new DataTable();

            if (conn.State == ConnectionState.Closed)
                conn.Open();

            cmd.Connection = conn;
            cmd.CommandTimeout = 120;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.Fill(dt);

            conn.Close();

            return dt;
        }

        // ---------------- TRANSACTION WITH LAST INSERTED ID ----------------
        public long[] SaveTransactionalData(List<SqlCommand> cmdList)
        {
            long lastInsertedId = 0;
            int rowsAffected = 0;

            if (conn.State == ConnectionState.Closed)
                conn.Open();

            SqlTransaction transaction = conn.BeginTransaction();

            try
            {
                for (int i = 0; i < cmdList.Count; i++)
                {
                    SqlCommand cmd = cmdList[i];

                    foreach (SqlParameter param in cmd.Parameters)
                    {
                        if (param.Value == null)
                            param.Value = DBNull.Value;
                    }

                    cmd.Connection = conn;
                    cmd.Transaction = transaction;
                    cmd.CommandTimeout = 30;

                    if (i == 0)
                    {
                        // First command should return SCOPE_IDENTITY()
                        object result = cmd.ExecuteScalar();
                        lastInsertedId = Convert.ToInt64(result);
                    }
                    else
                    {
                        if (lastInsertedId != 0)
                            cmd.Parameters.AddWithValue("@LastInsertedId", lastInsertedId);

                        rowsAffected += cmd.ExecuteNonQuery();
                    }
                }

                transaction.Commit();
            }
            catch
            {
                transaction.Rollback();
                rowsAffected = 0;
                throw;
            }
            finally
            {
                conn.Close();
            }

            return new long[] { rowsAffected, lastInsertedId };
        }
    }
}


    