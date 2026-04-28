# GitFlow Branching Strategy

## Branches
- **main**: Production-ready, stable releases
- **develop**: Integration branch for next release
- **feature/***: New features (e.g., feature/monitoring-dashboard)
- **release/***: Pre-production releases (e.g., release/v5.0)
- **hotfix/***: Emergency patches (e.g., hotfix/security-patch)

## Workflow
1. Feature work: `develop` → `feature/name`
2. Testing: `feature/name` → PR to `develop`
3. Release: `develop` → `release/version`
4. Production: `release/version` → `main`
5. Hotfix: `main` → `hotfix/name` → `main` + `develop`
