<?php
declare(strict_types=1);

use PHPUnit\Framework\TestCase;

final class ProjectPagesTest extends TestCase
{
    private string $publicPath;

    protected function setUp(): void
    {
        $this->publicPath = realpath(__DIR__ . '/../public');
    }

    public function testProjectPageExists(): void
    {
        $file = $this->publicPath . '/project.php';
        $this->assertFileExists($file, 'project.php should exist inside public/');
    }

    public function testEditProjectPageExists(): void
    {
        $file = $this->publicPath . '/edit-project.php';
        $this->assertFileExists($file, 'edit-project.php should exist inside public/');
    }

    public function testProjectPageContainsTitlePlaceholder(): void
    {
        $file = $this->publicPath . '/project.php';
        $this->assertFileExists($file);

        $content = file_get_contents($file);
        $this->assertStringContainsString(
            "<?= h(\$p['title']) ?>",
            $content,
            'project.php should display project title'
        );
    }

    public function testEditProjectPageContainsUpdateForm(): void
    {
        $file = $this->publicPath . '/edit-project.php';
        $this->assertFileExists($file);

        $content = file_get_contents($file);

        $this->assertStringContainsString(
            '<form',
            $content,
            'edit-project.php should contain a form tag'
        );

        $this->assertStringContainsString(
            'name="title"',
            $content,
            'edit-project.php should contain title input'
        );
    }

    public function testProjectPageHasOwnerActionLinks(): void
    {
        $file = $this->publicPath . '/project.php';
        $this->assertFileExists($file);

        $content = file_get_contents($file);
        $this->assertIsString($content, 'project.php must be readable');

        // Check for Edit button
        $this->assertStringContainsString(
            'edit-project.php',
            $content,
            'project.php should provide an Edit link for owners'
        );

        // Check for Delete button
        $this->assertStringContainsString(
            'delete-project.php',
            $content,
            'project.php should provide a Delete link for owners'
        );
    }
}
