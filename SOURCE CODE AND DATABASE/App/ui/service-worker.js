const CACHE_NAME = 'my-cache-v1';
const urlsToCache = [
    './addproduct.php',
    './style.css',
    './icons/icon-192.png',
    './icons/icon-512.png',
    './offline.html' // 
];

console.log('Service Worker installing...');
self.addEventListener('install', event => {
    
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => {
            console.log('Caching files:', urlsToCache);
            return cache.addAll(urlsToCache)
                .then(() => {
                    console.log('Tous les fichiers ont été mis en cache avec succès');
                })
                .catch(err => {
                    console.error('Erreur lors de la mise en cache des fichiers:', err);
                });
        })
    );
});

self.addEventListener('activate', event => {
    console.log('Service Worker activating...');
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cacheName => {
                    if (cacheName !== CACHE_NAME) {
                        console.log('Supprimons le cache obsolète:', cacheName);
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});

self.addEventListener('fetch', event => {
    console.log('Interception de la requête:', event.request.url);
    event.respondWith(
        caches.match(event.request).then(response => {
            return response || fetch(event.request).then(fetchResponse => {
                // On met en cache la réponse si elle n'est pas déjà dans le cache
                return caches.open(CACHE_NAME).then(cache => {
                    cache.put(event.request, fetchResponse.clone());
                    return fetchResponse;
                });
            });
        })
    );
});
