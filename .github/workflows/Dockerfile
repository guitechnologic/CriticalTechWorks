# imagem base oficial python
FROM python:3.11-slim

# diretório dentro do container
WORKDIR /app

# copia dependências primeiro (cache de build)
COPY requirements.txt .

# instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# copia o resto do projeto
COPY . .

# porta padrão de exemplo (api futuramente)
EXPOSE 8000

# comando padrão ao iniciar container
CMD ["python", "app/main.py"]