import { load } from 'cheerio';

function normalizeWhitespace(value = '') {
    return value.replace(/\s+/g, ' ').trim();
}

export function parseWorkshopHtml(html, installedWorkshopIds = new Set()) {
    const $ = load(html);
    const seen = new Set();
    const results = [];

    $('.workshopItem').each((_, element) => {
        const card = $(element);
        const ugcLink = card.find('a.ugc[data-publishedfileid]').first();
        const detailLink = card.find('a.item_link[href*="filedetails/?id="]').first();
        const workshopId =
            ugcLink.attr('data-publishedfileid')?.trim() ||
            detailLink.attr('href')?.match(/id=(\d+)/)?.[1];

        if (!workshopId || seen.has(workshopId)) {
            return;
        }

        const title = normalizeWhitespace(card.find('.workshopItemTitle').first().text());
        if (!title) {
            return;
        }

        const preview = ugcLink.find('.workshopItemPreviewImage').first().attr('src')?.trim() || null;
        const rawAuthor = normalizeWhitespace(card.find('.workshopItemAuthorName').first().text());
        const author = rawAuthor.replace(/^by\s+/i, '').trim();

        results.push({
            workshopId,
            title,
            preview,
            author,
            installed: installedWorkshopIds.has(workshopId)
        });

        seen.add(workshopId);
    });

    return results;
}
