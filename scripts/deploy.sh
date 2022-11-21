#!/bin/bash
set -e

git config --local user.email "github-actions[bot]@users.noreply.github.com"
git config --local user.name "github-actions[bot]"

echo "Setting up build of documentation and tagging it with version" $MIKE_VERSION;

if [[ $MIKE_ALIAS ]]; then
	echo "Alias set to" $MIKE_ALIAS;
fi

docker run --rm -v $(pwd):/docs squidfunk/mkdocs-material:8.5.9 mike deploy $MIKE_VERSION $MIKE_ALIAS --rebase --update-aliases
docker run --rm -v $(pwd):/docs squidfunk/mkdocs-material:8.5.9 mike set-default $MIKE_VERSION --push
echo "Documentation build & tagged"

exit 0