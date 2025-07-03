[![Banner][banner-image]](https://masterpoint.io/)

# AWS Nuke GitHub Actions Example

> **Automated, scheduled cleanup of an AWS account using [aws-nuke](https://github.com/ekristen/aws-nuke) driven by GitHub Actions.**

This directory contains a battle-tested workflow and configuration that we run nightly in Masterpoint testing and sandbox AWS accounts to ensure they stay squeaky-clean. Feel free to reference, fork, and adapt it to suit your own accounts – *just be sure you understand exactly what will be deleted first!* 🧨

---

## Contents

| File | Purpose |
| ---- | ------- |
| `nuke-action.yml` | GitHub Actions workflow that authenticates to AWS via OIDC and executes `aws-nuke` on a cron schedule (nightly by default). |
| `nuke-config.yml` | The `aws-nuke` configuration file – regions to target, resources to exclude, safety presets, etc. |

---

[banner-image]: https://masterpoint-public.s3.us-west-2.amazonaws.com/v2/standard-long-fullcolor.png
