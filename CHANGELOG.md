# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.0.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v2.0.0...v3.0.0) (2026-04-22)


### ⚠ BREAKING CHANGES

* Add blocked_encryption_types variable with SSE-C default ([#74](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/74))

### 🚀 Features

* Add blocked_encryption_types variable with SSE-C default ([#74](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/74)) ([816be32](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/816be32fbc1822699c5b0e93ae4baef69e26f499))

## [2.0.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.5.2...v2.0.0) (2025-09-24)


### ⚠ BREAKING CHANGES

* Add region support ([#71](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/71))

### 🚀 Features

* Add region support ([#71](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/71)) ([3bfee66](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/3bfee66323fc2d98a90bcaa122e12b5f2f3504c0))

## [1.5.2](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.5.1...v1.5.2) (2025-06-12)


### 🐛 Fixes

* optional bucket_key_encryption_policy_enforced ([#69](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/69)) ([a01966c](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/a01966ccbe3298bfd860b602c0748fbab6d1ef1d))

## [1.5.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.5.0...v1.5.1) (2025-06-11)


### 🐛 Fixes

* adding a toggle to enforce usage of the default bucket encryptio… ([#68](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/68)) ([58b3cf9](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/58b3cf9c507f025fd926903e2e007b05aaf60f0f))

## [1.5.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.4.3...v1.5.0) (2025-06-10)


### 🚀 Features

* Enable Requester Pays feature ([#65](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/65)) ([0afa976](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/0afa976f7544928f54feb6d86bd2e70b4ec16357))

### 🐛 Fixes

* improving validation on object lock settings ([#67](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/67)) ([ca0d1bf](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/ca0d1bfa4d98bdc6a8252d982e342603d57a766a))

## [1.4.3](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.4.2...v1.4.3) (2025-06-05)


### 🐛 Fixes

* lifecycle filter handling ([#64](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/64)) ([c3595b9](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/c3595b9845d25544fdf69ed970e37df75394fdb2))

## [1.4.2](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.4.1...v1.4.2) (2025-06-02)


### 🐛 Fixes

* Always set the filter attribute of the lifecycle ([#54](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/54)) ([2ac9eb6](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/2ac9eb666f2c58c8d20bb4f981757134ab9585b8))

## [1.4.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.4.0...v1.4.1) (2025-05-22)


### 🐛 Fixes

* guard access_control_policy validation against null value ([#59](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/59)) ([dba1201](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/dba12013fe96c2fcbba390034eeb18121caa7cb1))

## [1.4.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.3.0...v1.4.0) (2025-05-21)


### 🚀 Features

* Add support for Access Control Policies ([#57](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/57)) ([049a90c](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/049a90ca073ca592336fdba4a1d235f15bb0b99b))

## [1.3.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.2.1...v1.3.0) (2025-05-08)


### 🚀 Features

* Adding metrics and replication time in s3 replication configuration ([#53](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/53)) ([c3022f7](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/c3022f7f873722427cdf2cc2297a3dbaaddcb1ce))

## [1.2.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.2.0...v1.2.1) (2025-03-26)


### 🐛 Fixes

* transition_default_minimum_object_size argument dependency ([#52](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/52)) ([bdfebfe](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/bdfebfe09b37a7fcbd63a3e7847440b17f7879d1))

## [1.2.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.1.0...v1.2.0) (2025-02-20)


### 🚀 Features

* Add support for transition_default_minimum_object_size ([#51](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/51)) ([a2c0e4a](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/a2c0e4a0584d66d9d8613fd3c021fea462f42e92))

## [1.1.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v1.0.0...v1.1.0) (2025-02-12)


### 🚀 Features

* Add S3 Malware protection with Guardduty ([#49](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/49)) ([3652909](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/3652909078c6d4285e2852d532ef8bec9245399f))

## [1.0.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.15.0...v1.0.0) (2025-02-07)


### 🚀 Features

* breaking: enhance lifecycle rule typing and add additional filter options, enable default S3 versioning ([#48](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/48)) ([4123613](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/412361331688cc5e3eb831a0107c86219ed0bfaa))

## [0.15.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.14.1...v0.15.0) (2024-11-01)


### 🚀 Features

* target object key format support ([#45](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/45)) ([c1ef74f](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/c1ef74f008da50dc61c7f4fe297fe7db2997ef58))

## [0.14.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.14.0...v0.14.1) (2024-08-05)


### 🐛 Fixes

* Add `id` output to be compatible with s3 bucket data resource ([#44](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/44)) ([16b64f3](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/16b64f3dcfe263f25bfbdb539686b84553e9eeff))

## [0.14.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.13.1...v0.14.0) (2024-05-14)


### 🚀 Features

* Adding replication kms for destination bucket, including source selection criteria ([#43](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/43)) ([a069334](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/a0693342965674ede148c2535ba5b3c1c0e5da22))

## [0.13.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.12.1...v0.13.1) (2024-03-15)


### 🐛 Fixes

* bug: aws_s3_bucket_inventory always create a change when filter is ab… ([#41](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/41)) ([0b28d99](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/0b28d992db916bca8d41b234396b582aa5ba1703))

## [0.12.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.12.0...v0.12.1) (2024-01-02)


### 🐛 Fixes

* bug: reference bucket output instead of the name to solve referencing issues with bucket prefix ([#38](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/38)) ([b827d26](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/b827d263c9a183ff932476327f8136eac2ee9966))

## [0.12.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.11.0...v0.12.0) (2024-01-02)


### 🚀 Features

* add support to provide a prefix as name, add validation ([#37](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/37)) ([8deb75b](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/8deb75bb030c89301356651727474bc7472b5f84))

## [0.11.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.10.1...v0.11.0) (2023-10-02)


### 🚀 Features

* enhancement: remove logging in own bucket more explicitly ([#36](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/36)) ([58372cf](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/58372cf671ea6cd1e2c6906522a250f7043863a6))

### 🐛 Fixes

* enhancement: remove logging in own bucket more explicitly ([#36](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/36)) ([58372cf](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/58372cf671ea6cd1e2c6906522a250f7043863a6))

## [0.10.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.10.0...v0.10.1) (2023-09-07)


### 🐛 Fixes

* Fix error in ACL configuration ([#35](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/35)) ([91576f1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/91576f15691ff1de8b29fc24966f2a4578f44295))

## [0.10.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.9.1...v0.10.0) (2023-07-21)


### 🚀 Features

* Add support for EventBridge notifications ([#34](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/34)) ([5fe5044](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/5fe5044f1ea9d27bbb1c3a92cf2e40568967802e))

## [0.9.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.9.0...v0.9.1) (2023-07-04)


### 🐛 Fixes

* Error "Number of distinct destination bucket ARNs cannot exceed 1" by adding required properties to rule block to have it parsed as XML schema V2 ([#33](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/33)) ([82d118a](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/82d118a3cceb2d01ca01dafa8508c60f9b300fe5))

## [0.9.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.8.0...v0.9.0) (2023-06-27)


### 🚀 Features

* Changes replication_configuration variable so it supports multiple rules ([#31](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/31)) ([8078a69](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/8078a69ed8b4ca4eeb9a5d0123e9879db874e37b))

## [0.8.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.7.1...v0.8.0) (2023-06-23)


### 🚀 Features

* improvement: Update and simplify aws_s3_bucket_ownership_controls ([#26](https://github.com/schubergphilis/terraform-aws-mcaf-s3/pull/26)) ([99219ed](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/commit/99219ed3b6827a239ea2239a1292f158c6760e37))

## [0.7.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.7.0...v0.7.1) (2023-04-24)

## [0.7.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.6.3...v0.7.0) (2022-10-13)

## [0.6.3](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.6.2...v0.6.3) (2022-09-05)

## [0.6.2](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.6.1...v0.6.2) (2022-08-22)

## [0.6.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.6.0...v0.6.1) (2022-08-08)

## [0.6.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.5.1...v0.6.0) (2022-08-02)

## [0.5.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.5.0...v0.5.1) (2022-07-08)

## [0.5.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.4.1...v0.5.0) (2022-03-03)

## [0.4.1](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.4.0...v0.4.1) (2022-03-01)

## [0.4.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.3.0...v0.4.0) (2022-02-28)

## [0.3.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.2.0...v0.3.0) (2021-11-03)

## [0.2.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.12...v0.2.0) (2021-06-11)

## [0.1.12](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.11...v0.1.12) (2021-06-09)

## [0.1.11](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.10...v0.1.11) (2021-04-30)

## [0.1.10](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.9...v0.1.10) (2020-08-25)

## [0.1.9](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.8...v0.1.9) (2020-08-17)

## [0.1.8](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.7...v0.1.8) (2020-08-03)

## [0.1.7](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.6...v0.1.7) (2020-02-12)

## [0.1.6](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.5...v0.1.6) (2019-12-23)

## [0.1.5](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.4...v0.1.5) (2019-09-26)

## [0.1.4](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.3...v0.1.4) (2019-08-08)

## [0.1.3](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.2...v0.1.3) (2019-07-31)

## [0.1.2](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.0...v0.1.2) (2019-07-26)

## [0.1.0](https://github.com/schubergphilis-ep/terraform-aws-mcaf-s3/compare/v0.1.1...v0.1.0) (2019-07-09)

## 0.1.1 (2019-07-09)

