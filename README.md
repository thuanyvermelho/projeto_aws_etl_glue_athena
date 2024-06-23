<<<<<<< HEAD






# projeto_aws_etl_glue_athena
=======
# AWS - Projeto de Engenharia de Dados: ETL da HealthTech utilizando S3, AWS Glue, Amazon Athena e Amazon QuickSight

Este repositório contém o código e a documentação para o projeto de ETL (Extract, Transform, Load) dos dados de uma empresa HealthTech. O projeto utiliza as ferramentas da AWS para a execução e gerenciamento dos recursos de dados.

### Pré-requisitos

Pré-requisitos
Antes de iniciar, certifique-se de ter instalado em sua máquina local:

* Git
* Docker
* Conta na AWS (Amazon Web Services)

## Clone o repositório e configure as dependências

### Clonar o repositório
```
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/thuanyvermelho/projeto_aws_etl_glue_athena.git
git push -u origin main
```

### Executar o ambiente local com Docker
Este projeto utiliza Docker para configurar um ambiente local com Spark e Jupyter Notebook para testes.

```
FROM jupyter/pyspark-notebook:latest

# Copie os arquivos do projeto para o contêiner
COPY data.zip /home/jovyan/work/data.zip
COPY src /home/jovyan/work/src
COPY test /home/jovyan/work/test

# Ajuste a propriedade dos diretórios para o usuário jovyan
USER root
RUN chown -R jovyan:users /home/jovyan/work

# Descompacte o arquivo data.zip
RUN unzip /home/jovyan/work/data.zip -d /home/jovyan/work/data

# Remova o arquivo zip após a descompactação
RUN rm /home/jovyan/work/data.zip

# Exponha a porta usada pelo Jupyter
EXPOSE 8888

# Comando para iniciar o Jupyter
CMD ["start-notebook.sh"]

```
## Construir e executar o contêiner Docker
```
docker build -t projeto_aws_etl_healthtech .
docker run -p 8888:8888 projeto_aws_etl_healthtech
```
### Acesse o Jupyter Notebook
Abra o navegador e vá para http://localhost:8888 e use o token gerado para acessar o Jupyter.

## Arquitetura do Projeto
A arquitetura do projeto foi construída para ser escalável e integrar os dados de múltiplas fontes da empresa HealthTech.

### Componentes
**Amazon S3:** Usado para armazenar arquivos de dados brutos e arquivos de dados processados.<br>
**AWS Glue Crawler:** Catalogação dos dados no Glue Data Catalog.<br>
**AWS Glue Job:** Processa e transforma os dados.<br>
**Amazon Athena:** Consulta os dados transformados.<br>
**Amazon QuickSight:** Criação de dashboards interativos e relatórios.<br>

## Estrutura do Projeto e Fluxo do ETL

### Carregamento dos Dados Brutos no S3:

Os arquivos `dados_cadastro_2.csv`, `dados_cadastro_3.json`, e `dados_cadastro_1.parquet` são carregados no bucket `data-client-raw/upload`.

### Execução da Lambda:

Uma função Lambda é acionada sempre que novos arquivos são carregados no S3 para:

1 - Iniciar o Glue Job que lê os dados catalogados.<br>
2 - Transformar e unificar os dados das três fontes.<br>
3 - Gravar os dados transformados em formato Parquet no bucket `data-client-processed/output/dados_tratados`, particionados por convenio.<br>

### Execução do Glue Crawler:

O Glue Crawler para roda apenas uma vez e ele atualizará o catálogo quando novos dados forem adicionados ou quando houver mudanças necessária

Consultas e Visualizações:
Os dados transformados são consultáveis no Amazon Athena `src\consultas_athena\queries.sql.`
Os dados são disponibilizados para visualizações e criação de dashboards no Amazon QuickSight.

## Estrutura do Projeto 

 - `src/:` Contém os scripts do job ETL e da função lambda.
    - `Consultas_athena`: Contém as queries efetuadas no athena.
 -  `data.zip/:` Contém os 3 arquivos zipados.
 - `tests/:` Contém o script de teste local no Jupyter Notebook.
 - `Dockerfile:` Arquivo Docker para configurar o ambiente local.
 - `dicionario_dados.md:` Dicionário dos dados tratados.
 - `README.md:` Este arquivo de documentação.

>>>>>>> f819c56 (Adicionando projeto ETL com Docker e documentação)
