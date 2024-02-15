using DbController;
using DbController.MySql;
using Microsoft.Extensions.Configuration;
using SmartHome.Core.Models;
using SmartHome.Core.Interfaces;
using System.Globalization;

namespace SmartHome.Core.Services
{
    public static class AppdataService
    {
        public static string[] SupportedCultureCodes => SupportedCultures.Select(x => x.Name).ToArray();

        public static CultureInfo[] SupportedCultures => new CultureInfo[]
        {
            new CultureInfo("de"),
            new CultureInfo("en")
        };

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

        public static string ConnectionString => _configuration?["MySQL:ConnectionString"] ?? string.Empty;

        public static string BridgeIP => _configuration?["HueConnection:BridgeIP"] ?? string.Empty;
        public static string UserID => _configuration?["HueConnection:UserID"] ?? string.Empty;

        public static int PageLimit => _configuration?.GetValue<int>("Filter:PageLimit") ?? 30;

        public static CultureInfo ToCulture(this ILocalizationHelper helper)
        {

            var culture = SupportedCultures.FirstOrDefault(x => x.TwoLetterISOLanguageName.Equals(helper.Code, StringComparison.OrdinalIgnoreCase));

            if (culture is null)
            {
                return SupportedCultures[0];
            }
            else
            {
                return culture;
            }
        }
    }
}