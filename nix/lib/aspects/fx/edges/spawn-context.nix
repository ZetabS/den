{ ... }:
{
  # Fallback rewalk starts from the parent scope for fleet visibility, so restore
  # the source scope's own entity binding (for example, `user`) explicitly.
  mkSourceScopeBindings =
    {
      scopeContexts,
      scopeEntityKind,
      sourceScopeId,
    }:
    let
      sourceCtx = scopeContexts.${sourceScopeId} or { };
      ownKind = scopeEntityKind.${sourceScopeId} or null;
      ownRecord = if ownKind == null then null else sourceCtx.${ownKind} or null;
    in
    if ownRecord == null then { } else { ${ownKind} = ownRecord; };
}
