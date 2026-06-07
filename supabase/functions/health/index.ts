import { corsHeaders } from "../_shared/cors_headers.ts";
import { jsonResponse } from "../_shared/json_response.ts";

Deno.serve((request) => {
  if (request.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  return jsonResponse({
    status: "ok",
    service: "memeory-edge-functions",
  });
});
