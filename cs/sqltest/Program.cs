using System.Data.SqlClient;

// ...

string connectionString = "Data Source=2DAWNG\\SQLEXPRESS;Initial Catalog=loginapp;Integrated Security=True;TrustServerCertificate=True";

using (SqlConnection connection = new SqlConnection(connectionString))
{
    connection.Open();

    // Execute SQL commands here...

    connection.Close();
}
