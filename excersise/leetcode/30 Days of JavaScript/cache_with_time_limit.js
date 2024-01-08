var TimeLimitedCache = function() {
    this.cache = {};
};

/**
 * @param {number} key
 * @param {number} value
 * @param {number} duration time until expiration in ms
 * @return {boolean} if un-expired key already existed
 */
TimeLimitedCache.prototype.set = function(key, value, duration) {
    const currentTime = Date.now();
    const existed = this.cache.hasOwnProperty(key) && this.cache[key].expiry > currentTime;
    const expiry = currentTime + duration;
    this.cache[key] = { value, expiry };
    return existed;
};

/**
 * @param {number} key
 * @return {number} value associated with key
 */
TimeLimitedCache.prototype.get = function(key) {
    const currentTime = Date.now();
    if (this.cache.hasOwnProperty(key) && this.cache[key].expiry > currentTime) {
        return this.cache[key].value;
    }
    return -1;
};

/**
 * @return {number} count of non-expired keys
 */
TimeLimitedCache.prototype.count = function() {
    const currentTime = Date.now();
    return Object.values(this.cache).filter(entry => entry.expiry > currentTime).length;
};

/**
 * const timeLimitedCache = new TimeLimitedCache()
 * timeLimitedCache.set(1, 42, 1000); // false
 * timeLimitedCache.get(1) // 42
 * timeLimitedCache.count() // 1
 */