import { env } from "../config/env";

export type ChatMessage = {
  role: "system" | "user" | "assistant";
  content: string;
};

export async function ollamaChat(
  messages: ChatMessage[],
  model = "llama3.1:8b",
  temperature = 0.2
) {
  const resp = await fetch(`${env.OLLAMA_BASE_URL}/api/chat`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ model, messages, options: { temperature } }),
  });
  if (!resp.ok) {
    const txt = await resp.text();
    throw new Error(`Ollama error: ${txt}`);
  }
  const data = await resp.json();
  return data;
}
