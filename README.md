# oc-hub

>A lightweight site that indexes and links all OpenConfidential repositories.

## Purpose

This repository is the source for the `oc-hub` website — a single place to discover projects, docs, and team links for the OpenConfidential organization.

## Deploy to Cloudflare Pages

1. Create a new repository on your Git provider and push this code.
2. In the Cloudflare dashboard, open **Pages** → **Create a project** and connect the new repo.
3. For a plain static site: set the framework to "None" (or leave blank), no build command, and the build output directory to `/` or leave blank.
4. Deploy the site. Note the `*.pages.dev` subdomain Cloudflare provides.
5. Add the custom domain `openconfidential.ai` in the Pages project settings and follow Cloudflare's verification steps.
6. Update DNS: if Cloudflare manages DNS for `openconfidential.ai`, add the recommended CNAME/ALIAS per Pages' instructions (Cloudflare supports CNAME flattening for root domains).

## Files

- `index.html` — minimal landing page and repo index placeholder
- `CNAME` — contains the custom domain `openconfidential.ai` (used by some static hosts)

## Next steps (optional)

- Populate `index.html` with a JSON-driven index of repositories.
- Add a small admin UI to edit repo metadata.
- Add CI to auto-regenerate listings from an organization API.

If you want, I can scaffold a simple JSON index and a script to read your existing repos and render them on the site.
