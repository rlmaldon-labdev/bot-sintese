# CONTEXT - bot-sintese

## Objetivo
Gerar sintese processual factual a partir de PDFs (e documentos do processo), sem estrategia juridica.
Saidas principais: `sintese_processual.md` e `sintese_processual.docx`.

## Entrada e saida
- Entrada: pasta de processo com PDFs (idealmente com OCR/texto pesquisavel).
- Saida: arquivos de sintese na mesma pasta do processo.
- Config local: `botsintese_config.yaml` (gerado/lido pelo script).

## Fluxo tecnico
1. `botsintese.py` carrega config e escolhe modo (GUI ou CLI).
2. Extrai texto e detecta sistema (PJe, eProc, SAJ, etc.).
3. Divide em chunks e consulta LLM (local/cloud).
4. Consolida dados factuais e monta relatorio final.
5. Gera Markdown e DOCX.

## Arquivos-chave
- `botsintese.py`: aplicacao principal (GUI + CLI + extracao + geracao de relatorio).
- `README.md`: guia geral de uso.
- `GUIA_APIS.md`: detalhes de provedores cloud.
- `GUIA_INSTALACAO_ESCRITORIO.md`: setup operacional.
- `requirements.txt`: dependencias Python.

## Modos suportados
- `google` (Gemini)
- `local` (Ollama)
- `anthropic`
- `openai`
- `xai`

## Comandos rapidos
- GUI: `python botsintese.py`
- CLI: `python botsintese.py "C:\caminho\pasta" google`
- CLI local: `python botsintese.py "C:\caminho\pasta" local`

## Configuracao critica (`botsintese_config.yaml`)
- `apis.google`, `apis.anthropic`, `apis.openai`, `apis.xai`
- `ollama.host`, `ollama.modelo`
- `modo_padrao`

## Riscos comuns
- PDF sem OCR (texto nao extraivel).
- Chave API ausente no modo cloud.
- Ollama indisponivel no modo local.
- Pasta de entrada sem arquivos validos.

## Retomada rapida (prompt sugerido)
"Use `bot-sintese/CONTEXT.md` como base e trabalhe apenas em [arquivos]."

## Regra operacional
Evitar subir chaves de API e arquivos com dados sensiveis de clientes.
