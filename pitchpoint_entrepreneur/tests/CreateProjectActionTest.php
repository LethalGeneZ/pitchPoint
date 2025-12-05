<?php

use PHPUnit\Framework\TestCase;

class CreateProjectActionTest extends TestCase
{
    private string $actionsPath;

    protected function setUp(): void
    {
        parent::setUp();
        $this->actionsPath = __DIR__ . '/../actions';
    }

    public function testCreateProjectActionFileExists()
    {
        $file = $this->actionsPath . '/create_project.php';
        $this->assertFileExists(
            $file,
            'create_project.php should exist for creating projects'
        );
    }

    public function testCreateProjectFileContainsExpectedFields()
    {
        $file = $this->actionsPath . '/create_project.php';
        $content = file_get_contents($file);

        // Only check fields we are sure exist
        $this->assertStringContainsString('title', $content, 'create_project.php should include project title handling');
        $this->assertStringContainsString('budget', $content, 'create_project.php should include project budget handling');
    }
}
