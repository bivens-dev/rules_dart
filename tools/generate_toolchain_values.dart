import 'dart:convert';
import 'dart:io';

// Edit the following values as needed
const releaseChannel = 'stable';
const dartVersion = '2.18.6';
const supportedPlatforms = [
  'linux-x64',
  'linux-ia32',
  'linux-arm64',
  'linux-arm',
  'macos-x64',
  'macos-arm64',
  'windows-x64',
  'windows-ia32'
];

// No need to edit below this line unless debugging
Future<void> main(List<String> args) async {
  print("Append the following output to dart/private/versions.bzl \n");

  print("\"${dartVersion}\": {");

  for (var platform in supportedPlatforms) {
    final hashValue = await downloadHashValue(dartVersion, platform);
    final correctHashValue = await convertHashValue(hashValue!);
    print("\t\"${platform}\": \"${correctHashValue}\",");
  }

  print("},");
}

Future<String?> downloadHashValue(
    String versionNumber, String platformVersion) async {
  // 1. Generate the URL
  var hashUrl = Uri(
    scheme: 'https',
    host: 'storage.googleapis.com',
    path:
        '/dart-archive/channels/${releaseChannel}/release/${versionNumber}/sdk/dartsdk-${platformVersion}-release.zip.sha256sum',
  );

  // 2. Download the file
  var client = HttpClient();
  try {
    HttpClientRequest request = await client.getUrl(hashUrl);
    // Write to the request object...
    HttpClientResponse response = await request.close();
    // Process the response
    if (response.statusCode != 200) {
      // TODO: Make a custom error with a helpful message
      throw Error();
    }

    final stringData = await response.transform(utf8.decoder).join();
    // 3. Extract the part we care about.
    // Results are normally in the form "hashValue localFilename"
    final hashValue = stringData.split(' ')[0];
    return (hashValue);
  } catch (error) {
    throw error;
  } finally {
    client.close();
  }
}

Future<String?> convertHashValue(String hashValue) async {
  const hashOriginalFilename = 'hash_originals.txt';
  const hashConvertedFilename = 'hash_converted.dat';

  try {
    // 1. Write a file to disk containing the hash value
    final seedFile = await File(hashOriginalFilename);
    await seedFile.writeAsString(hashValue);

    // 2. Run xxd and have it read from the original file and write to the new file
    await Process.run(
        'xxd', ['-r', '-p', hashOriginalFilename, hashConvertedFilename]);

    // 3. Read the result from the generated file and encode it
    final resultFile = await File(hashConvertedFilename);
    final fileContents = await resultFile.readAsBytes();
    final encodedValue = base64Encode(fileContents);

    // 4. Clean up the files as they are no longer needed
    await seedFile.delete();
    await resultFile.delete();

    // 5. Return the Base64 encoded value
    return "sha256-$encodedValue";
  } catch (e) {
    throw e;
  }
}
