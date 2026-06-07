type GroqMessage = {
  role: "system" | "user" | "assistant";
  content: string;
};

type GroqChatOptions = {
  model: string;
  messages: GroqMessage[];
  temperature?: number;
  maxTokens?: number;
};

export class GroqClient {
  constructor(
    private readonly apiKey = Deno.env.get("GROQ_API_KEY") ?? "",
  ) {}

  async chat(options: GroqChatOptions): Promise<string> {
    if (!this.apiKey) {
      throw new Error("Missing GROQ_API_KEY.");
    }

    const response = await fetch("https://api.groq.com/openai/v1/chat/completions", {
      method: "POST",
      headers: {
        Authorization: `Bearer ${this.apiKey}`,
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        model: options.model,
        messages: options.messages,
        temperature: options.temperature ?? 0.2,
        max_tokens: options.maxTokens ?? 2048,
        response_format: { type: "json_object" },
      }),
    });

    if (!response.ok) {
      const errorText = await response.text();
      throw new Error(`Groq request failed: ${response.status} ${errorText}`);
    }

    const payload = await response.json();
    return payload.choices?.[0]?.message?.content ?? "";
  }
}
