# 🔑 Guia de APIs - BotSíntese v2.0

Este guia explica como obter e configurar as chaves de API para cada provedor.

---

## 📋 Índice

1. [Google Gemini](#google-gemini) ⭐ **GRATUITO - Recomendado**
2. [Modo Local (Ollama)](#ollama-local) - Gratuito, mais lento
3. [Anthropic Claude](#anthropic-claude) - Pago
4. [OpenAI GPT](#openai-gpt) - Pago
5. [xAI Grok](#xai-grok) - Pago

---

## Google Gemini

### ⭐ GRATUITO - Recomendado para começar!

O Google AI Studio oferece acesso **gratuito** ao Gemini 1.5 Flash com limites generosos.

### Limites do plano gratuito

| Limite | Valor | Suficiente? |
|--------|-------|-------------|
| Requisições/minuto | 15 RPM | ✅ Sim |
| Requisições/dia | 1.500 RPD | ✅ ~100 processos/dia |
| Tokens/minuto | 1M TPM | ✅ Processo inteiro de uma vez |
| **Custo** | **R$ 0,00** | 🎉 |

### ⚠️ Aviso sobre privacidade

No plano gratuito, os dados enviados **podem ser usados pelo Google** para treinar modelos.

| Situação | Recomendação |
|----------|--------------|
| Processo público | ✅ Gemini gratuito |
| Segredo de justiça | ⚠️ Use modo Local |
| Cliente preocupado com privacidade | ⚠️ Use modo Local |

### Passo a passo (2 minutos)

1. **Acesse o Google AI Studio**
   - Vá para: https://aistudio.google.com/
   - Faça login com sua conta Google

2. **Crie uma API Key**
   - Clique em **"Get API Key"** no menu lateral
   - Clique em **"Create API Key"**
   - Selecione um projeto ou crie um novo
   - Copie a chave (começa com `AIza...`)

3. **Configure no BotSíntese**
   - Abra o programa
   - Clique em **"⚙️ Configurar APIs"**
   - Cole a chave no campo "Google (Gemini)"
   - Clique em "Salvar"

4. **Pronto!**
   - Selecione "Google Gemini" como modo
   - Processe seus documentos gratuitamente

### Não precisa de cartão de crédito!

O plano gratuito do AI Studio é separado do Google Cloud. Você não precisa cadastrar cartão nem usar seus créditos do GCP.

---

## Anthropic Claude

### Por que usar?
- Excelente compreensão de textos jurídicos
- Claude Sonnet tem ótimo custo-benefício

### Passo a passo

1. **Crie uma conta**
   - Acesse: https://console.anthropic.com/
   - Faça cadastro (precisa de cartão de crédito)

2. **Adicione créditos**
   - Vá em "Billing" no menu
   - Adicione créditos (mínimo $5)

3. **Gere a API Key**
   - Vá em "API Keys"
   - Clique em "Create Key"
   - Dê um nome (ex: "BotSintese")
   - Copie a chave (começa com `sk-ant-...`)

4. **Configure no BotSíntese**
   - Cole no campo "Anthropic (Claude)"

### Preços (referência)
| Modelo | Input | Output |
|--------|-------|--------|
| Claude Sonnet 4 | $3/1M tokens | $15/1M tokens |
| Claude Haiku | $0.25/1M tokens | $1.25/1M tokens |

---

## OpenAI GPT

### ⚠️ Importante
A assinatura do **ChatGPT Plus ($20/mês)** NÃO inclui acesso à API.
Você precisa de uma conta separada na plataforma de API.

### Passo a passo

1. **Crie conta na plataforma**
   - Acesse: https://platform.openai.com/
   - Faça cadastro (conta diferente do ChatGPT)

2. **Adicione créditos**
   - Vá em "Billing" > "Add payment details"
   - Adicione créditos (mínimo $5)

3. **Gere a API Key**
   - Vá em "API Keys" no menu
   - Clique em "Create new secret key"
   - Copie a chave (começa com `sk-...`)
   - ⚠️ A chave só aparece uma vez!

4. **Configure no BotSíntese**
   - Cole no campo "OpenAI (GPT)"

### Preços (referência)
| Modelo | Input | Output |
|--------|-------|--------|
| GPT-4o | $2.50/1M tokens | $10/1M tokens |
| GPT-4o-mini | $0.15/1M tokens | $0.60/1M tokens |

---

## xAI Grok

### Passo a passo

1. **Acesse o console xAI**
   - Vá para: https://console.x.ai/
   - Faça login (pode usar conta do X/Twitter)

2. **Adicione créditos**
   - Configure método de pagamento
   - Adicione créditos

3. **Gere a API Key**
   - Vá em "API Keys"
   - Crie uma nova chave
   - Copie a chave

4. **Configure no BotSíntese**
   - Cole no campo "xAI (Grok)"

### Preços (referência)
| Modelo | Input | Output |
|--------|-------|--------|
| Grok Beta | $5/1M tokens | $15/1M tokens |

---

## Ollama (Local)

### Por que usar?
- 100% gratuito
- Dados nunca saem do seu computador
- Funciona offline

### Requisitos
- GPU NVIDIA com 8GB+ VRAM
- WSL2 instalado no Windows

### Instalação

1. **Instale o Ollama no WSL2**
   ```bash
   curl -fsSL https://ollama.com/install.sh | sh
   ```

2. **Baixe o modelo**
   ```bash
   ollama pull llama3.1:8b-instruct-q4_K_M
   ```

3. **Inicie o servidor**
   ```bash
   ollama serve
   ```
   Mantenha este terminal aberto enquanto usa o BotSíntese.

### Configuração

O BotSíntese já vem configurado para usar:
- Host: `http://localhost:11434`
- Modelo: `llama3.1:8b-instruct-q4_K_M`

Se precisar mudar, clique em "⚙️ Configurar APIs".

---

## 🔄 Como alternar entre modos

### Pelo programa (recomendado)
1. Abra o BotSíntese
2. Selecione o modo desejado na lista
3. O programa salva sua escolha como padrão

### Pelo arquivo de configuração
Edite `botsintese_config.yaml`:

```yaml
modo_padrao: google   # Opções: local, google, anthropic, openai, xai
```

### Pela linha de comando
```bash
python botsintese.py "C:\pasta\processo" google
python botsintese.py "C:\pasta\processo" local
python botsintese.py "C:\pasta\processo" anthropic
```

---

## 💰 Comparativo de Custos

Para um processo de ~200 páginas:

| Provedor | Tempo | Custo estimado |
|----------|-------|----------------|
| Local (Ollama) | 5-10 min | R$ 0,00 |
| Google Gemini Flash | 1-2 min | R$ 0,50-1,00 |
| Anthropic Claude | 1-2 min | R$ 1,00-3,00 |
| OpenAI GPT-4o | 1-2 min | R$ 2,00-5,00 |
| xAI Grok | 1-2 min | R$ 1,00-3,00 |

---

## 🔒 Segurança

- As chaves de API ficam salvas apenas no seu computador
- O arquivo `botsintese_config.yaml` não é enviado para lugar nenhum
- Cada provedor tem políticas diferentes sobre retenção de dados
- Para máxima privacidade, use o modo **Local (Ollama)**

---

## ❓ Problemas comuns

### "API key inválida"
- Verifique se copiou a chave completa
- Algumas chaves só aparecem uma vez - gere uma nova se necessário

### "Quota exceeded" / "Rate limit"
- Você excedeu o limite gratuito ou seus créditos acabaram
- Adicione mais créditos na plataforma do provedor

### "Connection error" (modo local)
- Verifique se o Ollama está rodando: `ollama serve`
- Teste no navegador: http://localhost:11434

### Google: "API not enabled"
- Ative a "Generative Language API" no Google Cloud Console
