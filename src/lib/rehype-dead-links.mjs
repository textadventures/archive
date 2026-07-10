import { visit } from 'unist-util-visit';
import deadLinks from '../data/dead-links.json' with { type: 'json' };

const deadDomains = new Set(deadLinks.domains.map((d) => d.toLowerCase()));
const deadUrls = new Set(deadLinks.urls.map((u) => u.replace(/\/$/, '')));

function isDead(href) {
    let url;
    try {
        url = new URL(href);
    } catch {
        return false; // relative link (internal /blog/..., /blogimages/..., mailto:, etc.)
    }
    if (!/^https?:$/.test(url.protocol)) return false;
    const hostname = url.hostname.toLowerCase();
    if (deadDomains.has(hostname) || deadDomains.has(hostname.replace(/^www\./, ''))) {
        return true;
    }
    return deadUrls.has(href.replace(/\/$/, ''));
}

export default function rehypeDeadLinks() {
    return (tree) => {
        visit(tree, 'element', (node) => {
            if (node.tagName !== 'a' || !node.properties?.href) return;
            const href = String(node.properties.href);
            if (!isDead(href)) return;

            let hostname = href;
            try {
                hostname = new URL(href).hostname.replace(/^www\./, '');
            } catch {}

            const originalChildren = node.children;
            node.tagName = 'span';
            node.properties = {
                className: ['dead-link'],
                title: `This link no longer works. It originally pointed to: ${href}`,
            };
            node.children = [
                ...originalChildren,
                {
                    type: 'element',
                    tagName: 'small',
                    properties: { className: ['dead-link-domain'] },
                    children: [{ type: 'text', value: ` (dead link: ${hostname})` }],
                },
            ];
        });
    };
}
