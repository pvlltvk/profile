# Outputs current kubectl context 
function kctl_context_info() {
  local context
  context=$(command kubectl config current-context 2> /dev/null)
  echo "$context"
}

# Outputs current kubectl namespace
function kctl_namespace_info() {
  local ns
  ns=$(command kubectl config get-contexts | grep '*' | awk '{print $5 }' 2> /dev/null)
  echo "$ns"
}
