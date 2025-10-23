import { ollamaChat } from "../lib/ai";

const SYSTEM_PROMPT = `Tu es l'assistant HSE. Reponds en francais, concis et actionnable. Si l'information n'est pas dans le contexte fourni, dis "Information absente du standard".`;

export async function chat(req: any, res: any) {
  const { messages, model, temperature } = req.body;
  const data = await ollamaChat(
    [ { role: "system", content: SYSTEM_PROMPT }, ...(messages || []) ],
    model,
    temperature
  );
  res.json(data);
}
