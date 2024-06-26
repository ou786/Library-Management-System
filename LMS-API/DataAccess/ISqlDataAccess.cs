namespace LMS.Api.DataAccess
{
    public interface ISqlDataAccess
    {
        Task<IEnumerable<T>> GetData<T, P>(string spName, P parameters, string connectionId = "conn");

        Task SaveData<T>(string spName, T parameters, string connectionId = "conn");

        Task UpdateData(string spName, object parameters, string connectionId = "conn");

        Task DeleteData(string spName, object parameters, string connectionId = "conn");

        Task<IEnumerable<T>> CustomQuery<T>(string query, string connectionId = "conn");
    }
}