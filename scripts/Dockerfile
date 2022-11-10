FROM squidfunk/mkdocs-material:6.0.2
RUN pip install mike

# Set working directory
WORKDIR /docs

# Start development server by default
ENTRYPOINT ["mike"]