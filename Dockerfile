FROM nginx:alpine

# Site estático. Copiamos SÓ os arquivos do site: esta pasta também guarda
# materiais do pós-doc (termos de bolsa, dados de survey, repositórios de
# alunos) que nunca devem ir para a imagem.
COPY index.html publicacoes.html estudos.html styles.css /usr/share/nginx/html/

# Template de configuração do nginx (a porta vem do Railway via $PORT)
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

# Railway injeta PORT; default 8080 para rodar local
ENV PORT=8080
EXPOSE 8080

# A imagem oficial do nginx processa /etc/nginx/templates/*.template
# com envsubst no entrypoint.
CMD ["nginx", "-g", "daemon off;"]
