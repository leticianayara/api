FROM python:3.13.4-alpine3.22

#Define o diretorio de trabalho dentro do container
WORKDIR /app

#Copia o arquivo de requisitos e instala as depencias
#Usamos --no-cache-dir para evitar o cache do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#Copia o restante do código da aplicacao para o diretório de trabalho
COPY . .

#Expoe a porta que a aplicacao FastAPI irá rodar (padrao é 8000)
EXPOSE 8000

#Comando para rodar a aplicação usando uvicorn
#O host 0.0.0.0 permite que a aplicacao seja acessivel externamente a contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]