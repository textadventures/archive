import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const PostSchema = z.object({
    PostId: z.string(),
    UserId: z.number(),
    Username: z.string(),
    AvatarUrl: z.optional(z.string().nullable()),
    UserAvatar: z.string().nullable(),
    UserGravatar: z.string().nullable(),
    EditableText: z.string(),
    EditableFormat: z.string(),
    HTML: z.string(),
    PostDate: z.string(),
    LastEditDate: z.string().nullable(),
    link: z.optional(z.string().nullable()),
});

const getForumCollection = (forumId: string) => defineCollection({
    loader: glob({
        pattern: "**/*.json",
        base: `./src/data/forums/${forumId}`,
    }),
    schema: z.object({
        Topic: z.object({
            TopicId: z.string(),
            ForumId: z.string(),
            Title: z.string(),
            LastUpdated: z.string(),
            ReplyCount: z.number(),
        }),
        Posts: z.array(PostSchema),
    }),
});

export const forumDetails: Record<string, { title: string, replacement: string }> = {
    "quest": {
        title: "Quest",
        replacement: "For Quest, please create new topics over at <a href=\"https://github.com/textadventures/quest/discussions\">GitHub Discussions for the Quest repo</a>."
    },
    "samples": {
        title: "Libraries and Code Samples",
        replacement: "For Libraries and Code Samples, please create new topics over at <a href=\"https://github.com/textadventures/quest/discussions/categories/libraries-and-code-samples\">GitHub Discussions for the Quest repo</a> (Libraries and Code Samples category)."
    },
    "questkit": {
        title: "Quest 6 and QuestJS",
        replacement: "For Quest 6 and QuestJS, please create new topics over at <a href=\"https://github.com/ThePix/QuestJS/discussions\">GitHub Discussions for the QuestJS repo</a>."
    },
    "squiffy": {
        title: "Squiffy",
        replacement: "For Squiffy, please create new topics over at <a href=\"https://github.com/textadventures/squiffy/discussions\">GitHub Discussions for the Squiffy repo</a>."
    },
    "games": {
        title: "Game Announcements and Feedback",
        replacement: "For Game Announcements and Feedback, post in GitHub Discussions for <a href=\"https://github.com/textadventures/quest/discussions\">Quest</a> or <a href=\"https://github.com/textadventures/squiffy/discussions\">Squiffy</a>, or over at <a href=\"https://intfiction.org/c/playing/project-announcements/50\">intfiction.org</a>."
    },
    "design": {
        title: "Interactive Fiction and Game Design",
        replacement: "For Interactive Fiction and Game Design, we suggest posting at <a href=\"https://intfiction.org/c/authoring/general-design-discussions/17\">intfiction.org</a>."
    },
    "general": {
        title: "General Discussion",
        replacement: "For general discussion, please create new topics over at <a href=\"https://github.com/orgs/textadventures/discussions\">GitHub Discussions</a>."
    },
    "site": {
        title: "Site Announcements and Feedback",
        replacement: "For discussion about this website, please create new topics over at <a href=\"https://github.com/orgs/textadventures/discussions\">GitHub Discussions</a>."
    }
};

export const allForums = Object.keys(forumDetails);
const design = getForumCollection("design");
const games = getForumCollection("games");
const general = getForumCollection("general");
const quest = getForumCollection("quest");
const questkit = getForumCollection("questkit");
const samples = getForumCollection("samples");
const site = getForumCollection("site");
const squiffy = getForumCollection("squiffy");

const blog = defineCollection({
  loader: glob({ pattern: "**/*.md", base: "./src/content/blog" }),
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
  }).passthrough(), // allows extra fields like categories
});

export const collections = { design, games, general, quest, questkit, samples, site, squiffy, blog };

export type Post = z.infer<typeof PostSchema>;