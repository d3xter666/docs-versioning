#!/bin/bash
set -e

git config --local user.email "github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"

echo "Setting up build of documentation and tagging it with version" $MIKE_VERSION;

if [[ $MIKE_ALIAS ]]; then
	echo "Alias set to" $MIKE_ALIAS;
fi

# docker run --rm -it -v $(pwd):/docs squidfunk/mkdocs-material:6.0.2 /bin/sh -c "mike deploy ${MIKE_VERSION} ${MIKE_ALIAS} --update-aliases && mike set-default ${MIKE_VERSION}"
docker run --rm -v $(pwd):/docs squidfunk/mkdocs-material:6.0.2 deploy 0.9 --update-aliases
echo "Documentation build & tagged"

exit 0