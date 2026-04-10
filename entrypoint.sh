#!/bin/sh
echo "DEBUG: OPENROUTER_KEY=$OPENROUTER_KEY"
echo "DEBUG: All env vars:"
env | grep -i openrouter
cat > /app/librechat.yaml << EOF
version: 1.3.8

endpoints:
  custom:
    - name: 'openrouter'
      apiKey: '$OPENROUTER_KEY'
      baseURL: 'https://openrouter.ai/api/v1'
      models:
        default: ['openrouter/auto']
        fetch: true
      titleConvo: true
      titleModel: 'openrouter/auto'
      summaryModel: 'openrouter/auto'
      modelDisplayLabel: 'OpenRouter'
      vision: true
EOF
echo "DEBUG: Generated librechat.yaml:"
cat /app/librechat.yaml
npm run backend

