using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Xml.Linq;

namespace LMS.Api.DataAccess
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;
        public SqlDataAccess(IConfiguration config)
        {
            _config = config;
        }
        
        public async Task<IEnumerable<T>> GetData<T, P>(string spName, P parameters, string connectionId = "conn")
        {
            using SqlConnection connection = new SqlConnection
                (_config.GetConnectionString(connectionId));
            await connection.OpenAsync();
            try
            {
                return await connection.QueryAsync<T>(spName, parameters, commandType:
                CommandType.StoredProcedure);
            } finally { connection.Close(); }
     
        }

        public async Task SaveData<T>(string spName, T parameters, string connectionId = "conn")
        {
            using SqlConnection connection = new SqlConnection
                (_config.GetConnectionString(connectionId));
            await connection.OpenAsync();
            try
            {
                await connection.ExecuteAsync(spName, parameters, commandType:
                CommandType.StoredProcedure);
            }
            finally { connection.Close(); }
        }

        public async Task DeleteData(string spName, object parameters, string connectionId = "conn")
        {
            using SqlConnection connection = new SqlConnection(_config.GetConnectionString(connectionId));
            await connection.OpenAsync();
            try
            {
                await connection.ExecuteAsync(spName, parameters, commandType: CommandType.StoredProcedure);
            }
            finally { connection.Close(); }
        }

        public async Task UpdateData(string spName, object parameters, string connectionId = "conn")
        {
            using SqlConnection connection = new SqlConnection(_config.GetConnectionString(connectionId));
            await connection.OpenAsync();
            try
            {
                await connection.ExecuteAsync(spName, parameters, commandType: CommandType.StoredProcedure);
            }
            finally { connection.Close(); }
        }

        public async Task<IEnumerable<T>> CustomQuery<T>(string query, string connectionId = "conn")
        {
            using SqlConnection connection = new SqlConnection(_config.GetConnectionString(connectionId));
            await connection.OpenAsync();
            try
            {
                return await connection.QueryAsync<T>(query);
            }
            finally { connection.Close(); }
        }


    }
}
