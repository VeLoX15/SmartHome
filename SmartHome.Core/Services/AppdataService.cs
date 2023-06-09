using DbController;
using DbController.MySql;
using Microsoft.Extensions.Configuration;
using SmartHome.Core.Models;

namespace SmartHome.Core.Services
{
    public static class AppdatenService
    {
        public static bool FirstUserExists { get; set; } = false;

        public static List<Permission> Permissions { get; set; } = new();

        private static IConfiguration? _configuration;

        public static async Task InitAsync(IConfiguration configuration)
        {
            _configuration = configuration;
            using IDbController dbController = new MySqlController(ConnectionString);
            Permissions = await PermissionService.GetAllAsync(dbController);
            FirstUserExists = await UserService.FirstUserExistsAsync(dbController);
        }


        /// <summary>
        /// Creates or updates an object in the corresponding list fro the type <see cref="T"/>
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="input"></param>
        public static void UpdateRecord<T>(T input) where T : class, IDbModel, new()
        {
            List<T> list = GetList<T>();

            T? item = list.FirstOrDefault(x => x.Id == input.Id);

            if (item is null)
            {
                list.Add(input);
            }
            else
            {
                int index = list.IndexOf(item);
                list[index] = input;
            }
        }
        /// <summary>
        /// Deletes an item from the corresponding object list.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="input"></param>
        public static void DeleteRecord<T>(T input) where T : class, IDbModel, new()
        {
            List<T> list = GetList<T>();
            list.Remove(input);
        }
        /// <summary>
        /// Gets the corresponding list for the type <see cref="T"/>
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns>This method never returns null. When no list for <see cref="T"/> is specified, it returns a new empty list</returns>
        public static List<T> GetList<T>() where T : class, IDbModel, new()
        {
            var input = new T();
            object tmp = input switch
            {
                Permission => Permissions,
                _ => new List<T>()
            };

            List<T> list = (List<T>)tmp;
            return list;
        }

        /// <summary>
        /// Gets the corresponding item for the specified ID.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="id"></param>
        /// <returns>When found this method returns an item of type <see cref="T"/>, otherwise it returns null.</returns>
        public static T? Get<T>(int id) where T : class, IDbModel, new()
        {
            if (id is 0)
            {
                return null;
            }

            List<T> list = GetList<T>();

            T? item = list.FirstOrDefault(x => x.Id == id);

            return item;
        }

        public static string ConnectionString => _configuration?["ConnectionString"] ?? string.Empty;
        public static bool IsLdapLoginEnabled => _configuration?.GetSection("LdapSettings").GetValue<bool>("ENABLE_LDAP_LOGIN") ?? false;
        public static bool IsLocalLoginEnabled => _configuration?.GetSection("LdapSettings").GetValue<bool>("ENABLE_LOCAL_LOGIN") ?? false;
        public static string LdapServer => _configuration?["LdapSettings:LDAP_SERVER"] ?? string.Empty;
        public static string LdapDomainServer => _configuration?["LdapSettings:DOMAIN_SERVER"] ?? string.Empty;
        public static string LdapDistinguishedName => _configuration?["LdapSettings:DistinguishedName"] ?? string.Empty;

        public static Dictionary<string, string> MimeTypes => _configuration?.GetSection("MimeTypes").GetChildren().ToDictionary(x => x.Key, x => x.Value!) ?? new Dictionary<string, string>();
        public static int PageLimit => _configuration?.GetValue<int>("PageLimit") ?? 30;
    }
}
