# 🤖 BotSíntese v3.0

**Síntese Processual Automatizada**

Extrai, organiza e sintetiza dados de processos judiciais de forma factual, sem análises ou sugestões jurídicas.

---

## ✨ O que há de novo na v3.0

- **Normalização de partes**: Remove duplicatas por acento/caixa (ex: "AVANÇADA" = "AVANCADA")
- **Histórico separado**: "Histórico Processual" (atos do PJe) vs "Linha do Tempo dos Fatos" (contratos, pagamentos)
- **Filtragem de ruído**: Remove eventos irrelevantes ("Documento assinado eletronicamente", "Concluso para", etc.)
- **Ordenação cronológica correta**: Datas ordenadas por dd/mm/aaaa
- **Deduplicação inteligente de valores**: Remove valores duplicados mesmo com descrições diferentes

### Versões anteriores
- **v2.0**: Múltiplos provedores (Google, Anthropic, etc.), detecção de sistema
- **v1.0**: Modo local apenas (Ollama)

---

## 📋 O que o BotSíntese faz

✅ **Extrai:**
- Dados do processo (número, vara, valor da causa)
- Partes e advogados
- Histórico cronológico de eventos
- Valores mencionados
- Teses de cada parte
- Decisões proferidas

❌ **NÃO faz:**
- Análise jurídica
- Sugestões de teses
- Recomendações estratégicas
- Prognóstico do caso

O objetivo é gerar um **resumo factual** para você usar com uma LLM na nuvem depois.

---

## 🚀 Instalação

### 1. Dependências Python

```bash
pip install requests pyyaml PyPDF2 python-docx
```

### 2. Configure o Google Gemini (GRATUITO - 2 minutos)

1. Acesse https://aistudio.google.com/
2. Clique em "Get API Key" → "Create API Key"
3. Copie a chave
4. No BotSíntese, clique em "⚙️ Configurar APIs"
5. Cole no campo "Google (Gemini)"
6. Pronto! Use gratuitamente.

### 3. (Opcional) Para modo Local

Se preferir processar 100% offline:
```bash
# No WSL2
curl -fsSL https://ollama.com/install.sh | sh
ollama pull llama3.1:8b-instruct-q4_K_M
```

---

## 📖 Como usar

### 1. Prepare os PDFs

- Coloque todos os PDFs do processo em uma pasta
- Certifique-se de que têm OCR (texto pesquisável)
- Pode ser um PDF único ou vários arquivos separados

### 2. Execute o BotSíntese

**Modo gráfico:**
```bash
python botsintese.py
```

**Modo linha de comando:**
```bash
python botsintese.py "C:\caminho\pasta" google
python botsintese.py "C:\caminho\pasta" local
```

### 3. Selecione o modo

| Modo | Custo | Velocidade | Quando usar |
|------|-------|------------|-------------|
| **Google Gemini** | **Grátis** | **1-2 min** | **Recomendado!** |
| Local | Grátis | 5-10 min | Privacidade máxima |
| Anthropic | ~R$ 1-3 | 1-2 min | Alternativa paga |
| OpenAI | ~R$ 2-5 | 1-2 min | Alternativa paga |
| xAI | ~R$ 1-3 | 1-2 min | Alternativa paga |

### 4. Resultado

O BotSíntese gera na pasta do processo:
- `sintese_processual.md` — Markdown (para copiar/colar)
- `sintese_processual.docx` — Word (para arquivar/imprimir)

---

## 📁 Estrutura do relatório

```markdown
# Síntese Processual
Processo: 5013956-21.2025.8.13.0701

## Dados Gerais
- Classe: Procedimento Comum Cível
- Vara: 6ª Vara Cível de Uberaba
- Valor da causa: R$ 47.886,00

## Partes
| Polo | Nome | Advogado |
|------|------|----------|
| Autor | Ricardo Talala | Defensoria Pública |
| Réu | CDB Money | Raphael Maldonado |

## Objeto da Ação
Rescisão contratual por onerosidade excessiva...

## Histórico Processual
| Data | Tipo | Descrição |
|------|------|-----------|
| 08/05/2025 | Petição Inicial | Autor pede... |
| 12/06/2025 | Contestação | Réu contesta... |

## Valores Identificados
- Contrato inicial: R$ 10.450,00
- Dívida final: R$ 37.866,00

## Teses das Partes
**Autor:** ...
**Réu:** ...

## Status Atual
Fase de especificação de provas
```

---

## ⚙️ Configuração

### Arquivo `botsintese_config.yaml`

```yaml
# APIs (preencha as que for usar)
apis:
  google: "AIza..."
  anthropic: "sk-ant-..."
  openai: "sk-..."
  xai: "..."

# Configuração local
ollama:
  host: "http://localhost:11434"
  modelo: "llama3.1:8b-instruct-q4_K_M"

# Modo padrão ao abrir o programa
modo_padrao: local
```

### Alterar modo padrão

1. **Pelo programa:** Selecione o modo e processe — ele salva como padrão
2. **Pelo arquivo:** Edite `modo_padrao` no YAML
3. **Por execução:** Passe como argumento na linha de comando

---

## 🔧 Solução de problemas

### Modo Local não funciona
```bash
# No WSL2, verifique se Ollama está rodando
ollama serve
```

### API retorna erro
- Verifique se a chave está correta
- Verifique se tem créditos/saldo
- Veja `GUIA_APIS.md` para detalhes de cada provedor

### PDF sem texto
- O PDF precisa ter OCR aplicado
- Use o Foxit Reader ou Adobe para fazer OCR antes

### Processo não identificado
- O sistema tenta detectar PJe, e-Proc automaticamente
- Se não detectar, usa modo genérico (funciona igual)

---

## 📊 Sistemas suportados

| Sistema | Detecção | Extração automática |
|---------|----------|---------------------|
| PJe (TJMG, etc.) | ✅ | Capa, partes, eventos |
| e-Proc (TRFs) | ✅ | Eventos numerados |
| SAJ (TJSP) | 🔄 Parcial | Básico |
| PROJUDI | 🔄 Parcial | Básico |
| PDF genérico | ✅ | Busca por padrões |

---

## 🔒 Privacidade

- **Modo Local:** Dados nunca saem do seu computador
- **Modo Cloud:** Dados são enviados para o provedor escolhido
- **Chaves de API:** Ficam apenas no seu computador

Para máxima privacidade, use sempre o modo **Local**.

---

## 📝 Changelog

### v3.0.0
- Normalização inteligente de nomes de partes (remove duplicatas por acento)
- Separação de histórico processual vs linha do tempo fática
- Filtragem de eventos irrelevantes do PJe
- Ordenação cronológica correta (dd/mm/aaaa)
- Deduplicação inteligente de valores

### v2.0.0
- Reescrita completa
- Múltiplos provedores de LLM
- Detecção de sistema processual
- Foco em extração factual
- Interface gráfica melhorada

### v1.0.0
- Versão inicial
- Apenas modo local (Ollama)

---

## 📄 Licença

Software fornecido "como está", sem garantias.
Desenvolvido com Claude (Anthropic).
