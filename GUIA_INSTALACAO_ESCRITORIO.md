# Guia de Instalação - BotSíntese v3.0
## PC do Escritório (Windows)

---

## Pré-requisitos

- Windows 10 ou 11
- Conexão com internet
- ~100 MB de espaço em disco

**Não precisa de:**
- GPU potente
- Muita memória RAM
- WSL ou Linux

---

## Passo 1: Instalar Python (5 minutos)

1. Acesse: https://www.python.org/downloads/
2. Clique no botão amarelo **"Download Python 3.x.x"**
3. Execute o instalador baixado
4. **IMPORTANTE:** Marque a opção ✅ **"Add Python to PATH"** na primeira tela
5. Clique em "Install Now"
6. Aguarde finalizar

### Verificar instalação
Abra o **Prompt de Comando** (tecla Windows → digite "cmd" → Enter) e digite:
```
python --version
```
Deve aparecer algo como `Python 3.12.x`

---

## Passo 2: Instalar dependências (2 minutos)

No mesmo Prompt de Comando, execute:
```
pip install requests pyyaml PyPDF2 python-docx
```

Aguarde baixar e instalar (são pacotes pequenos).

---

## Passo 3: Extrair o BotSíntese

1. Extraia o arquivo `botsintese_v3.zip` para uma pasta de sua preferência
   - Sugestão: `D:\BotSintese\` ou `C:\Users\SeuUsuario\BotSintese\`

2. Você terá estes arquivos:
   ```
   📁 botsintese_v3/
       📄 botsintese.py          ← programa principal
       📄 botsintese.bat         ← atalho para executar
       📄 botsintese_config.yaml ← configurações
       📄 requirements.txt
       📄 README.md
       📄 GUIA_APIS.md
   ```

---

## Passo 4: Configurar API do Google Gemini (3 minutos)

### 4.1 Obter chave gratuita

1. Acesse: https://aistudio.google.com/
2. Faça login com sua conta Google
3. Clique em **"Get API Key"** (canto superior direito)
4. Clique em **"Create API Key"**
5. Copie a chave (começa com `AIza...`)

### 4.2 Configurar no BotSíntese

**Opção A - Pelo programa:**
1. Execute o BotSíntese (clique duplo em `botsintese.bat`)
2. Clique em **"⚙️ Configurar APIs"**
3. Cole a chave no campo "Google (Gemini)"
4. Clique em "Salvar"

**Opção B - Manualmente:**
1. Abra o arquivo `botsintese_config.yaml` com o Bloco de Notas
2. Substitua `sua_chave_aqui` pela chave copiada:
   ```yaml
   apis:
     google: "AIzaSy..."
   ```
3. Salve o arquivo

---

## Passo 5: Usar o BotSíntese

### Executar

- **Clique duplo** em `botsintese.bat`
- Ou pelo Prompt de Comando:
  ```
  cd D:\BotSintese\botsintese_v3
  python botsintese.py
  ```

### Processar um processo

1. Clique em **"Selecionar Pasta do Processo"**
2. Navegue até a pasta que contém os PDFs
3. Selecione o modo **"Google Gemini - GRATUITO"**
4. Clique em **"Gerar Síntese"**
5. Aguarde ~1-2 minutos
6. Os arquivos serão salvos na mesma pasta:
   - `sintese_processual.md`
   - `sintese_processual.docx`

---

## Dicas de Uso

### Organização de pastas
```
📁 Clientes/
   📁 CDB Money/
      📁 5013956-21.2025.8.13.0701/
         📄 autos_completos.pdf
         📁 importantes/              ← opcional
            📄 contestacao.pdf
            📄 sentenca.pdf
```

### Marcar documentos importantes
Coloque em uma subpasta `importantes/` ou use prefixo:
- `IMPORTANTE_contestacao.pdf`
- `PRINCIPAL_sentenca.pdf`

O bot dará prioridade a esses arquivos.

### Criar atalho na área de trabalho
1. Clique direito em `botsintese.bat`
2. "Enviar para" → "Área de trabalho (criar atalho)"

---

## Solução de Problemas

### "Python não é reconhecido..."
→ Reinstale o Python marcando "Add to PATH"

### "ModuleNotFoundError: No module named 'requests'"
→ Execute novamente: `pip install requests pyyaml PyPDF2 python-docx`

### "API key não configurada"
→ Configure a chave do Gemini (Passo 4)

### "Rate limit atingido"
→ Normal! O programa espera 60s e continua automaticamente

### PDF sem texto extraído
→ O PDF precisa ter OCR. Use o Foxit ou Adobe para aplicar OCR antes.

---

## Resumo Rápido

| Passo | Ação | Tempo |
|-------|------|-------|
| 1 | Instalar Python (marcar "Add to PATH") | 5 min |
| 2 | `pip install requests pyyaml PyPDF2 python-docx` | 2 min |
| 3 | Extrair ZIP | 1 min |
| 4 | Configurar chave Gemini | 3 min |
| 5 | Usar! | ∞ |

**Tempo total: ~10 minutos**

---

## Contato

Qualquer problema, abra o `Log.txt` que é gerado junto com a síntese — ele mostra exatamente onde ocorreu o erro.

---

*BotSíntese v3.0 - Desenvolvido com Claude (Anthropic)*
