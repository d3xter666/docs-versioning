FROM squidfunk/mkdocs-material:6.0.2
RUN pip install mike

# Set working directory
WORKDIR /docs

COPY mkdocs.yml mkdocs.yml

# Expose MkDocs development server port
EXPOSE 8000

# Overwrite ENTRYPOINT from squidfunk/mkdocs-material:6.0.2
ENTRYPOINT [""]

# Start mkdocs development server by default
CMD [ "mkdocs", "serve", "--dev-addr=0.0.0.0:8000" ]