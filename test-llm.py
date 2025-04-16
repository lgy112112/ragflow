from openai import OpenAI

client = OpenAI(
  base_url="https://openrouter.ai/api/v1",
  api_key="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",
)

completion = client.chat.completions.create(
  extra_body={},
  model="openai/gpt-4.1",
  messages=[
    {
      "role": "user",
      "content": [
        {
          "type": "text",
          "text": "Who are you?"
        },
      ]
    }
  ]
)
print(completion.choices[0].message.content)