# 📁 Organizador de Arquivos — Batch
> por [RCC996](https://github.com/RCC996)

Conjunto de dois programas em **Batch (Windows)** para organizar arquivos automaticamente em pastas por categoria ou extensão, com um gerador de arquivos de teste incluso.

---

## 📦 Arquivos do repositório

| Arquivo | Descrição |
|---|---|
| `organizador_de_arquivos.bat` | Programa principal de organização |
| `criador_arquivos_test.bat` | Gerador de arquivos vazios para testes |
| `Comentado/organizador_de_arquivos-comentado.bat` | Versão anotada com comentários didáticos |
| `Comentado/criador_arquivos_test-comentado.bat` | Versão anotada com comentários didáticos |

> 💡 A pasta `Comentado/` contém as versões dos programas com comentários explicando cada comando e decisão do código — útil para quem quer entender o funcionamento interno ou está aprendendo Batch.

---

## 🗂️ organizador_de_arquivos.bat

### O que faz?
Organiza automaticamente os arquivos de uma pasta escolhida, movendo-os para subpastas criadas pelo próprio programa, de acordo com o tipo de organização escolhido.

### Como usar?

1. Execute o arquivo `organizador_de_arquivos.bat` como administrador (recomendado)
2. Escolha o **local** que deseja organizar:
   - `1` — Pasta Downloads
   - `2` — Área de Trabalho (Desktop)
   - `3` — Outro local (informe o caminho manualmente)
3. Escolha o **tipo de organização**:
   - `1` — Por **categorias/grupos** (ex: todos os PDFs, DOCXs e TXTs vão para a pasta `Documentos`)
   - `2` — Por **tipos/extensões** (ex: todos os PDFs vão para a pasta `pdf`, todos os PNGs para `png`, etc.)
4. Confirme e aguarde o processo finalizar.

### Tipos de organização

#### 1. Por Categorias
Os arquivos são movidos para pastas agrupadas por tipo de conteúdo, com subpastas por extensão dentro de cada categoria:

```
📂 Downloads/
├── 📂 Documentos/
│   ├── 📂 pdf/
│   ├── 📂 docx/
│   └── 📂 txt/
├── 📂 Imagens/
│   ├── 📂 jpg/
│   └── 📂 png/
├── 📂 Videos/
├── 📂 Musicas/
├── 📂 Planilhas/
├── 📂 Slides/
├── 📂 Compactados/
└── 📂 Executaveis/
```

#### 2. Por Tipos/Extensões
Cada extensão ganha sua própria pasta diretamente:

```
📂 Downloads/
├── 📂 pdf/
├── 📂 docx/
├── 📂 jpg/
├── 📂 mp4/
└── 📂 zip/
```

### Extensões suportadas

| Categoria | Extensões |
|---|---|
| Documentos | `.pdf` `.docx` `.doc` `.txt` `.rtf` `.odt` |
| Imagens | `.jpg` `.jpeg` `.png` `.gif` `.bmp` `.svg` `.webp` `.ico` |
| Planilhas | `.xlsx` `.xls` `.csv` `.ods` |
| Slides | `.pptx` `.ppt` `.odp` |
| Vídeos | `.mp4` `.mkv` `.avi` `.mov` `.wmv` `.flv` |
| Músicas | `.mp3` `.wav` `.wma` `.aac` `.flac` |
| Compactados | `.zip` `.rar` `.7z` `.tar` `.gz` |
| Executáveis | `.exe` `.msi` `.bat` `.sh` |

### ⚠️ Atenção
- Feche todos os arquivos da pasta antes de executar.
- O próprio arquivo `.bat` do programa **não será movido**, mesmo estando na pasta organizada.
- Caso já exista uma pasta de destino (ex: `Documentos`), o programa exibirá um aviso e continuará sem sobrescrever a pasta existente.
- **⚠️ Arquivos com nomes iguais serão substituídos automaticamente durante a movimentação!** Certifique-se de que não há arquivos duplicados na pasta antes de executar o programa. O autor não se responsabiliza por perda ou danos em arquivos decorrentes do uso do programa.

---

## 🧪 criador_arquivos_test.bat

### O que faz?
Cria automaticamente arquivos vazios em todas as extensões suportadas pelo `organizador_de_arquivos.bat`, dentro de uma pasta chamada `TESTE_BAT` na Área de Trabalho. Ideal para testar o organizador sem precisar criar arquivos manualmente.

### Como usar?

1. Execute o `criador_arquivos_test.bat`
2. O programa criará a pasta `TESTE_BAT` no Desktop automaticamente
3. Dentro dela, serão criados arquivos como:
   ```
   Arquivo_teste_1.pdf
   Arquivo_teste_2.docx
   Arquivo_teste_3.jpg
   ...
   ```
4. Após a criação, rode o `organizador_de_arquivos.bat` apontando para a pasta `TESTE_BAT` para testar a organização

---

## 💻 Requisitos

- Windows 7 ou superior
- Nenhuma instalação necessária — roda direto pelo CMD

---

## 📄 Sobre o projeto

Este projeto foi desenvolvido para **fins educacionais**, como forma de aprendizado de automação com Batch (Windows). Fique à vontade para explorar o código, especialmente a pasta `Comentado/` que contém as versões anotadas explicando cada detalhe da implementação.
