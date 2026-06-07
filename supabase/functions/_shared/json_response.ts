import { corsHeaders } from "./cors_headers.ts";

type ErrorBody = {
  code: string;
  message: string;
  status: number;
};

export function jsonResponse<T>(
  data: T,
  init: ResponseInit = {},
): Response {
  return new Response(
    JSON.stringify({
      data,
      error: null,
      meta: {
        request_id: crypto.randomUUID(),
        timestamp: new Date().toISOString(),
      },
    }),
    {
      ...init,
      headers: {
        "Content-Type": "application/json",
        ...corsHeaders,
        ...init.headers,
      },
    },
  );
}

export function errorResponse(error: ErrorBody): Response {
  return new Response(
    JSON.stringify({
      data: null,
      error,
      meta: {
        request_id: crypto.randomUUID(),
        timestamp: new Date().toISOString(),
      },
    }),
    {
      status: error.status,
      headers: {
        "Content-Type": "application/json",
        ...corsHeaders,
      },
    },
  );
}
