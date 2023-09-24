# APK Signing Notes

1. APKs are distributed on Universal ABIs. The APK size might be heavy
2. There should be only one release version
3. Keystore configuration should be in key.properties, under directory android/app
4. Do not use android way to build APK, instead,
   use [Flutter way](https://docs.flutter.dev/deployment/android?gclid=EAIaIQobChMIipOtxs_DgQMVsapmAh1_egPhEAAYASAAEgKPqPD_BwE&gclsrc=aw.ds#build-an-apk)
5. No iOS build for now, due to lots of requirements (also not free)