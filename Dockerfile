FROM squidfunk/mkdocs-material

RUN pip install \
    mkdocs-mermaid2-plugin

COPY docs /docs/docs
COPY mkdocs.yml /docs
