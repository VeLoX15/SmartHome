using DbController;
using SmartHome.Core.Models;

namespace SmartHome.Core.Services
{
    public class PermissionService
    {
        public async Task<List<Permission>> GetUserPermissionsAsync(int userId, IDbController dbController, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();
            string sql = @"SELECT p.*
    FROM user_permissions up
    INNER JOIN permissions p ON (p.permission_id = up.permission_id)
    WHERE user_id = @USER_ID";

            var list = await dbController.SelectDataAsync<Permission>(sql, new
            {
                USER_ID = userId
            }, cancellationToken);

            //await LoadPermissionDescriptionsAsync(list, dbController, cancellationToken);

            return list;
        }

        public async Task UpdateUserPermissionsAsync(User user, IDbController dbController, CancellationToken cancellationToken = default)
        {
            cancellationToken.ThrowIfCancellationRequested();
            // Step 1: Delete all permissions for the user.
            string sql = "DELETE FROM user_permissions WHERE user_id = @USER_ID";
            await dbController.QueryAsync(sql, new
            {
                USER_ID = user.UserId
            }, cancellationToken);

            // Step 2: Add all permissions from the object back.
            foreach (var permission in user.Permissions)
            {
                sql = @"INSERT INTO user_permissions
    (
    user_id,
    permission_id
    )
    VALUES
    (
    @USER_ID,
    @PERMISSION_ID
    )";

                await dbController.QueryAsync(sql, new
                {
                    USER_ID = user.UserId,
                    PERMISSION_ID = permission.PermissionId
                }, cancellationToken);

            }
        }
        public static async Task<List<Permission>> GetAllAsync(IDbController dbController)
        {
            string sql = "SELECT * FROM permissions";

            var list = await dbController.SelectDataAsync<Permission>(sql);
            return list;
        }
    }
}
