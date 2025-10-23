export const env = {
  PORT: Number(process.env.PORT) || 8080,
  JWT_SECRET: process.env.JWT_SECRET || "dev",
  OLLAMA_BASE_URL: process.env.OLLAMA_BASE_URL || "http://localhost:11434"
};
