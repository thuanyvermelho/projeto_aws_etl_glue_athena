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
