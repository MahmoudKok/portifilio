'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0202bb68a9505af58f91d6cc411d12b8",
"assets/AssetManifest.json": "d3e93482b3637112edfcfde415ef341c",
"assets/assets/images/about_me.png": "dad3821951e3fa96706286f2dd1aaf1f",
"assets/assets/images/coding/c++.png": "58c7d603e1a69325673b1f9da248fab2",
"assets/assets/images/coding/dart.png": "80e0cfaf4e39a2700665ae5762d76645",
"assets/assets/images/coding/flutter.png": "4509d3e78ce213975ab8814a81c71904",
"assets/assets/images/coding/java.png": "7296622b91a05381fdd38955821abfad",
"assets/assets/images/coding/python.png": "10327dc6812b05b66a2b6b44c55a097c",
"assets/assets/images/contact/facebookgif.gif": "574143b66c56c78205e2f9daaf1ee4a5",
"assets/assets/images/contact/gethubgif.gif": "4e2208ae912b222e6affd1edca0460bf",
"assets/assets/images/contact/linkingif.gif": "3df95f35d57b2ac59eefcdf86cf4f976",
"assets/assets/images/contact/telegramgif.gif": "84862ad7d08cd6aec8ed2cca0afa13bc",
"assets/assets/images/contact/whatsappgif.gif": "f65fd521b49ce8d860f531b3561789d1",
"assets/assets/images/experinces/flutter_bird.png": "1c98b1b7ff96d319c9d2998c84b274e4",
"assets/assets/images/experinces/icpc.jpg": "a90c697f35f23762a3e80eb6ff59415d",
"assets/assets/images/experinces/shai.jpg": "d2be4f90ebfb367d1b163d2eb4656f1e",
"assets/assets/images/land_screen.png": "154ee2bcc3f24a2f24207dc19b941ce0",
"assets/assets/images/me.png": "7886f74319e686e0cc30eb4053cb4226",
"assets/assets/images/me2.png": "88b5a495416b7dc9b1d7867461834acf",
"assets/assets/images/projects/flutter/cheap_shop.jpg": "8d442b821b0fd582bd7bdc1172521903",
"assets/assets/images/projects/flutter/SchoolMate.jpg": "47fe0a462baeb3316d793ffc244c9b4a",
"assets/assets/images/projects/ml/diamonds_ml.jpg": "d36c812e37873169a344d909f2ac220a",
"assets/assets/images/projects/ml/heart_beat_ml.jpg": "3b143dbd7379849a5bf2c84c71dadc2a",
"assets/assets/images/projects/ml/music_ml.jpg": "9098cad5533dfff2cd79a03178f871d1",
"assets/assets/images/projects/ml/SketchY.jpg": "acb9d15b6e2d4a927a21545cdc3fdc4d",
"assets/assets/images/skills/algo.png": "5c7c617b1fb5eaeac99d6439d403c7c9",
"assets/assets/images/skills/app_develop.png": "f0ea15e5b4cb513c5750619487cdc3d8",
"assets/assets/images/skills/cp.png": "1d5e5c9d4d984a9b3939db8a75469ac6",
"assets/assets/images/skills/firebaselogo.png": "c24b6b9c0fcd84c7b258879880472660",
"assets/assets/images/skills/github.png": "1598fbffd467d3dd9f8e43d20254edcb",
"assets/assets/images/skills/problem_solving.png": "97cb364f837f1c1cd3dd7cc84f96c595",
"assets/assets/images/skills/resfulApi.png": "9df044c67853e11cf4758af891abcab4",
"assets/assets/images/skills/search_ai.png": "f3056ac6d1217b8ed379c4c864c48252",
"assets/assets/pdf/Mahmoud_Kokeh_FlutterCv_e.pdf": "cb2efe68bd174ebc81afd3e3afcbcd83",
"assets/FontManifest.json": "a29ce8d2e45014327f2588c5d7e72a23",
"assets/fonts/MaterialIcons-Regular.otf": "b86de1cb3ec08a64e4811b28f2b1ff80",
"assets/NOTICES": "178f7cc5920457e6b0a6ba50416ef988",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/simple_circular_progress_bar/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b1cd828235b381d2c80fbab4df7ecc76",
"/": "b1cd828235b381d2c80fbab4df7ecc76",
"main.dart.js": "f8f08dfb1a134609a313d623202c945c",
"manifest.json": "d20ca6c40df89cf64d6a300216cee4b6",
"version.json": "d3354e6474a334c803f85345cbe0c6ac"};
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
