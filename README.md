# EP1 SQL - Análise de Desempenho de Bancos de Dados

## 📋 Visão Geral

Este repositório implementa um estudo comparativo de desempenho entre **PostgreSQL** e **MySQL** utilizando o banco de dados **StackOverflow**. O projeto avalia diferentes tipos de operações SQL e índices para entender como cada banco de dados responde a distintas estratégias de otimização.

## 🏗️ Estrutura do Repositório

ep1/
├── script.py                 # Script principal que executa os testes
├── init_zip.sh              # Script de inicialização
├── README.md                # Esta documentação
├── buscas/                  # Queries SQL para testes de busca
│   ├── chave-primaria_faixa_chaves_primarias/
│   ├── com_like/
│   ├── com_subconsultas/
│   ├── juncoes_e_juncoes_de_juncoes/
│   ├── nao_chave-primarias_com_selecoes_compostas/
│   └── operacoes_de_agrupamento_e_agregacoes/
├── insert/                  # Queries SQL para testes de INSERT
├── update/                  # Queries SQL para testes de UPDATE
├── delete/                  # Queries SQL para testes de DELETE
└── results/                 # Diretório de saída com resultados e análises
    ├── gera_graficos.ipynb  # Notebook Jupyter para análise e visualização dos resultados
    ├── mysql/               # Resultados dos testes MySQL (CSV com métricas de tempo e RAM)
    ├── postgree/            # Resultados dos testes PostgreSQL (CSV com métricas de tempo e RAM)
    ├── graficos_tempo/      # Gráficos gerados de comparação de tempo de execução
    └── graficos_ram/        # Gráficos gerados de comparação de uso de RAM
    

## 🔧 Pré-requisitos

### Dependências Externas
- **PostgreSQL** (versão 12+)
- **MySQL** (versão 8.0+)
- **Python** 3.7+
- **Jupyter Notebook** 

### Dependências Python
```bash
pip install pandas matplotlib seaborn numpy jupyter
```

### Configuração de Banco de Dados

Edite as seguintes variáveis em `script.py` conforme sua configuração:

```python
DB_NAME = "StackOverflow"          # Nome do banco de dados
PSQL_USER = "postgres"             # Usuário PostgreSQL
PSQL_PASSWORD = "postgres"         # Senha PostgreSQL
PSQL_HOST = "localhost"            # Host PostgreSQL
MYSQL_USER = "root"                # Usuário MySQL
MYSQL_PASSWORD = "mysql"           # Senha MySQL
```

## 🚀 Como Usar

### 1. Executar o Script Principal (`script.py`)

O `script.py` é responsável por executar todos os testes de desempenho.

```bash
python script.py
```

#### O que o script faz:

1. **Testes de DML (INSERT, UPDATE, DELETE)**
   - Cria tabelas temporárias
   - Executa operações de inserção, atualização e exclusão
   - Mede tempo de execução e consumo de memória RAM
   - Limpa os dados após os testes

2. **Testes de Busca (SELECT)**
   - Executa queries em diferentes cenários:
     - Busca por chave primária
     - Busca com LIKE
     - Busca com subconsultas
     - Busca com JOINs (junções simples e múltiplas)
     - Busca por chaves não-primárias
     - Operações de agrupamento e agregação

3. **Testes com Índices**
   - Testa desempenho com índices HASH
   - Testa desempenho com índices B+ Tree
   - Testa cenários com índices não ideais

4. **Múltiplas Execuções**
   - Executa cada teste 1, 2, 5, 10 e 20 vezes
   - Gera arquivos CSV com resultados: `{num_runs}_times.csv`

#### Saída

Os resultados são salvos em `results/`:
- `1_times.csv` - Resultados com 1 execução
- `2_times.csv` - Resultados com 2 execuções
- `5_times.csv` - Resultados com 5 execuções
- `10_times.csv` - Resultados com 10 execuções
- `20_times.csv` - Resultados com 20 execuções


### 2. Gerar Gráficos e Análises (`gera_graficos.ipynb`)

Após executar o script, use o Jupyter Notebook para visualizar e analisar os resultados.

Os arquivos result/postgree/estatisticas_consultas_postgresql.csv e results/mysql/estatisticas_consultas_mysql.csv devem ser salvos no Drive e sincronizado com seu Jupyter Notebook para funcionar.


```bash
jupyter notebook gera_graficos.ipynb
```

#### O que o notebook faz:

1. **Carrega os dados** dos arquivos CSV gerados pelo `script.py`
2. **Processa e agrupa** os dados por tipo de operação
3. **Gera visualizações**:
   - Gráficos de comparação entre PostgreSQL e MySQL
   - Análise de tempo de execução vs. número de repetições
   - Análise de consumo de RAM
   - Comparação de eficiência de índices
4. **Calcula estatísticas**:
   - Médias, medianas e desvio padrão
   - Taxa de melhoria com índices
   - Correlação entre número de execuções e tempo

#### Como usar:
1. Abra o notebook no Jupyter
2. Execute as células sequencialmente (Shift+Enter)
3. Visualize os gráficos gerados
4. Customize as análises conforme necessário

## ⚙️ Configuração de Variáveis

### RUN_COUNTS
Define quantas vezes cada teste será executado:
```python
RUN_COUNTS = [1, 2, 5, 10, 20]
```

### Alterando para testar apenas um banco
Comente as linhas de PostgreSQL em `script.py` se desejar testar apenas MySQL:
```python
#run_psql_query(...)  # Comentado
run_mysql_query(...)   # Ativo
```

## 📊 Compreendendo os Resultados

### Métricas Coletadas
- **time**: Tempo de execução em segundos (medido com `time.perf_counter()`)
- **ram**: Consumo máximo de RAM em KB (medido com `resource.getrusage()`)
- **name_of_query**: Identificador da operação (ex: "INSERT_MySQL", "BUSCA_HASH_CHAVE_PRIMARIA_PostgreSQL")

### Tipos de Testes
- `INSERT_*`: Operações de inserção de dados
- `UPDATE_*`: Operações de atualização de dados
- `DELETE_*`: Operações de remoção de dados
- `BUSCA_SEM_INDEX_*`: Buscas sem índices criados
- `BUSCA_HASH_*`: Buscas com índices HASH
- `BUSCA_B_PLUS_*`: Buscas com índices B+ Tree
- `BUSCA_*_NAO_IDEAL_*`: Buscas com índices não otimizados

## 🔄 Ordem de Execução Recomendada

1. **Insert** - Carrega os dados iniciais
2. **Busca** (qualquer momento após Insert) - Testa leitura
3. **Update** - Modifica dados (deve rodar após Insert por causa das dependências)
4. **Delete** - Remove dados (faz reset)
5. **Insert novamente** (se necessário para novos testes)

> ⚠️ **Importante**: O script atual executa tudo automaticamente na ordem correta. Modificações manuais podem quebrar a sequência.



