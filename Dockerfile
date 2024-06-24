FROM jupyter/pyspark-notebook:latest

# Copie os arquivos do projeto para o contêiner
COPY data /home/jovyan/work/data
COPY src /home/jovyan/work/src
COPY test /home/jovyan/work/test

# Ajuste a propriedade dos diretórios para o usuário jovyan
USER root
RUN chown -R jovyan:users /home/jovyan/work

# Exponha a porta usada pelo Jupyter
EXPOSE 8888

# Comando para iniciar o Jupyter
CMD ["start-notebook.sh"]
