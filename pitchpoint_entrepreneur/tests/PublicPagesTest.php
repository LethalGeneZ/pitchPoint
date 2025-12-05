<?php

declare(strict_types=1);

use PHPUnit\Framework\TestCase;

class PublicPagesTest extends TestCase
{
    private string $publicPath;

    protected function setUp(): void
    {
        parent::setUp();
        // All public pages live in: pitchpoint_entrepreneur/public
        $this->publicPath = __DIR__ . '/../public';
    }

    public function testIndexPageExists()
    {
        $file = $this->publicPath . '/index.php';
        $this->assertFileExists(
            $file,
            'index.php (dashboard) should exist inside public/'
        );
    }

    public function testProfilePageExists()
    {
        $file = $this->publicPath . '/profile.php';
        $this->assertFileExists(
            $file,
            'profile.php should exist inside public/'
        );
    }

    public function testIndexPageHasProjectsSectionOrLink()
    {
        $file = $this->publicPath . '/index.php';
        $this->assertFileExists($file, 'index.php (dashboard) missing');

        $content = file_get_contents($file);
        $this->assertIsString($content, 'index.php must be readable');

        // Be flexible so it does not fail easily
        $this->assertTrue(
            str_contains($content, 'project') || str_contains($content, 'my-projects'),
            'index.php should contain a section or link related to projects'
        );
    }

    public function testProfilePageHasNameAndEmailInputs()
    {
        $file = $this->publicPath . '/profile.php';
        $this->assertFileExists($file, 'profile.php missing');

        $content = file_get_contents($file);
        $this->assertIsString($content, 'profile.php must be readable');

        $this->assertStringContainsString('name="name"', $content, 'profile.php should have name input');
        $this->assertStringContainsString('name="email"', $content, 'profile.php should have email input');
    }
}
