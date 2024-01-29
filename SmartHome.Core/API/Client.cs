using SmartHome.Core.Services;

namespace SmartHome.Core.API
{
    public class Client
    {
        public static async Task ToggleDevice(int smartPlugId, bool powerOn)
        {
            using (HttpClient client = new())
            {
                string apiUrl = $"http://{AppdataService.BridgeIP}/api/{AppdataService.UserID}/lights/{smartPlugId}/state";
                string jsonBody = $"{{\"on\": {powerOn.ToString().ToLower()}}}";

                var content = new StringContent(jsonBody);
                content.Headers.ContentType.MediaType = "application/json";

                HttpResponseMessage response = await client.PutAsync(apiUrl, content);
            }
        }
    }
}
