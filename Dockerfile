FROM peterevans/liche:1.1.0

LABEL maintainer="Peter Evans <mail@peterevans.dev>"
LABEL repository="https://github.com/peter-evans/link-checker"
LABEL homepage="https://github.com/peter-evans/link-checker"

LABEL com.github.actions.name="Link Checker"
LABEL com.github.actions.description="An action for link checking repository Markdown and HTML files"
LABEL com.github.actions.icon="external-link"
LABEL com.github.actions.color="purple"

COPY LICENSE README.md /

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
