#!/bin/bash
# Simple test script to validate AGENTS.md content and structure

set -e

echo "🧪 Testing AGENTS.md Content and Structure"
echo "=========================================="

# Test 1: File exists
if [ ! -f "AGENTS.md" ]; then
  echo "❌ AGENTS.md file not found"
  exit 1
fi
echo "✅ AGENTS.md file exists"

# Test 2: Header format
if ! grep -q "^# AGENTS.md — Core Policy Reminder$" AGENTS.md; then
  echo "❌ Incorrect header format in AGENTS.md"
  exit 1
fi
echo "✅ Header format correct"

# Test 3: Check for mandatory behaviors section
if ! grep -q "All agents.*MUST:" AGENTS.md; then
  echo "❌ Mandatory behaviors section missing"
  exit 1
fi
echo "✅ Mandatory behaviors section present"

# Test 4: Check for referenced files mentions
required_refs=("project_overview.md" "status.md" "prompts/custom_instructions_v2.md")
for ref in "${required_refs[@]}"; do
  if ! grep -q "$ref" AGENTS.md; then
    echo "❌ Missing reference to $ref"
    exit 1
  fi
done
echo "✅ All required file references present"

# Test 5: Check uncertainty handling section
if ! grep -q "If in doubt:" AGENTS.md; then
  echo "❌ Uncertainty handling section missing"
  exit 1
fi
echo "✅ Uncertainty handling section present"

# Test 6: Check security guidelines
if ! grep -q "No secrets in repo" AGENTS.md; then
  echo "❌ Security guidelines missing"
  exit 1
fi
echo "✅ Security guidelines present"

echo ""
echo "🎉 All AGENTS.md tests passed!"
echo "📊 Content Summary:"
echo "   - File length: $(wc -l < AGENTS.md) lines"
echo "   - Word count: $(wc -w < AGENTS.md) words"
echo "   - Character count: $(wc -c < AGENTS.md) characters"