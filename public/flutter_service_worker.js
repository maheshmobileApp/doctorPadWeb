'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.json": "57569d6cc782ead7a5c77e3d9ac07ad3",
"assets/AssetManifest.smcbin": "de7880e6d2ff3f83c4cba11a3acec60b",
"assets/assets/fonts/Muli-Italic.ttf": "3406c566f4619ebcde57927c689223b7",
"assets/assets/fonts/Muli-Light.ttf": "397a56821c43e85da7725a53cd51ec9b",
"assets/assets/fonts/Muli-Regular.ttf": "fe82d4bebb545cd0d8c9683e258e961c",
"assets/assets/icons/call.png": "e295a0c96dc006d82b5ff1d656f2fa85",
"assets/assets/icons/call.svg": "df78c19df02600eddfc6279d3ee8aff8",
"assets/assets/icons/contact.png": "75f1924985f22127af7ef5f9e6cd11c9",
"assets/assets/icons/contact.svg": "4369e64acb1c2e92ec8b1a77b122e532",
"assets/assets/icons/doctor%2520.png": "0c5926bd89fc5c1cc4427d2ac70c25d4",
"assets/assets/icons/doctor.svg": "051b3f874f65bc20f74f5f956a3a9642",
"assets/assets/icons/email.png": "d33054f46b0d0ca13afd09c0db7a6291",
"assets/assets/icons/home.png": "bf5157200d2180faf2cdd3521703cdbd",
"assets/assets/icons/home.svg": "661ef68c41a71e0133935171f888f9b5",
"assets/assets/icons/message.svg": "7cdec1b1f4f678dce7d992fefa0b7b5a",
"assets/assets/images/add_doctor.png": "0b4941b60b62674ccb12b9d0be6baea6",
"assets/assets/images/add_hospitals.png": "89a3196d3dbf42c32bd83163823e25b6",
"assets/assets/images/doctor.png": "5da911b868c2fd3e2c3243465b40e9fc",
"assets/assets/images/doctpad.png": "b195ab14dcd338743ad3830163bff8e3",
"assets/assets/images/hospital_icon.jpg": "f3dc38bf0f0cf2bf4dc17aa1ef21dbdd",
"assets/assets/images/hospital_logo.png": "74b74acc6358580c21d6895260f3d1e7",
"assets/assets/images/logout.png": "1f5fe3041e08af33c7c96320bd0ddfba",
"assets/assets/images/search2.png": "d701144d197394a715efee523f8fdc5a",
"assets/assets/images/successfully.png": "6be26c05158a0e6e115fe38186019a7a",
"assets/assets/images/user2.png": "5b9a48c8d67a80d9e693117da6fc37bf",
"assets/assets/images/view_doctor.png": "092a10889a6b42d96a8f3b74f430378d",
"assets/assets/images/view_hospital.png": "8355488a95c27de420b2fb5f2ef91150",
"assets/assets/MyFlutterApp.ttf": "b97fa6c604ba9bc996fa4f706a51d4c0",
"assets/FontManifest.json": "df0412cbe502496dfb2f2f87e66017a3",
"assets/fonts/MaterialIcons-Regular.otf": "0b3fad272d4f6d3b0ac2c67136fe7a73",
"assets/NOTICES": "c61291b531095e1e9a55077a4c4e0bc9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "57d849d738900cfd590e9adc7e208250",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0c96f8c23c8c707260106c235eb5c002",
"/": "0c96f8c23c8c707260106c235eb5c002",
"main.dart.js": "f8352b3ff7b3d7915ac6aada290c65c8",
"manifest.json": "533083c33fc5981322c307449d88e452",
"splash/img/dark-1x.png": "3949ff2fc982353c02207097b563424d",
"splash/img/dark-2x.png": "0dd908845baba67a2a527167f98ad1ca",
"splash/img/dark-3x.png": "689ad4a15a829a0ee77fd9b4bb2c0150",
"splash/img/dark-4x.png": "eb08891ae51b69570e075b0befe0e5ef",
"splash/img/light-1x.png": "3949ff2fc982353c02207097b563424d",
"splash/img/light-2x.png": "0dd908845baba67a2a527167f98ad1ca",
"splash/img/light-3x.png": "689ad4a15a829a0ee77fd9b4bb2c0150",
"splash/img/light-4x.png": "eb08891ae51b69570e075b0befe0e5ef",
"splash/splash.js": "d6c41ac4d1fdd6c1bbe210f325a84ad4",
"splash/style.css": "a0020372f0a5a3e270280679b176bcc4",
"version.json": "f4c688403dbd817db6896ed2371b340e"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
