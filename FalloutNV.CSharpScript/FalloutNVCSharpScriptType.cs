﻿using System;
using System.Threading;
using Nexus.Client.Games.Gamebryo.ModManagement.Scripting;
using Nexus.Client.ModManagement;
using Nexus.Client.ModManagement.Scripting;
using Nexus.Client.ModManagement.Scripting.CSharpScript;
using Nexus.Client.Mods;

namespace Nexus.Client.Games.FalloutNV.Scripting.CSharpScript
{
	/// <summary>
	/// Describes the Fallout: New Vegas variant of the C# script type.
	/// </summary>
	public class FalloutNVCSharpScriptType : CSharpScriptType
	{
		#region Properties

		/// <summary>
		/// Gets the type of the base script for all C# scripts.
		/// </summary>
		/// <value>The type of the base script for all C# scripts.</value>
		protected override Type BaseScriptType
		{
			get
			{
				return typeof(FalloutNVCSharpBaseScript);
			}
		}

		#endregion

		/// <summary>
		/// Returns a proxy that implements the functions available to C# scripts.
		/// </summary>
		/// <param name="p_modMod">The mod being installed.</param>
		/// <param name="p_gmdGameMode">The game mode currently bieng managed.</param>
		/// <param name="p_eifEnvironmentInfo">The application's envrionment info.</param>
		/// <param name="p_igpInstallers">The utility class to use to install the mod items.</param>
		/// <param name="p_scxUIContext">The <see cref="SynchronizationContext"/> to use to marshall UI interactions to the UI thread.</param>
		/// <returns>A proxy that implements the functions available to C# scripts.</returns>
		protected override CSharpScriptFunctionProxy GetScriptFunctionProxy(IMod p_modMod, IGameMode p_gmdGameMode, IEnvironmentInfo p_eifEnvironmentInfo, InstallerGroup p_igpInstallers, SynchronizationContext p_scxUIContext)
		{
			BsaManager bmgBsaManager = new BsaManager((FalloutNVGameMode)p_gmdGameMode);
			UIUtil uitUiUtilities = new UIUtil(p_gmdGameMode, p_eifEnvironmentInfo, p_scxUIContext);
			return new FalloutNVCSharpScriptFunctionProxy(p_modMod, p_gmdGameMode, p_eifEnvironmentInfo, p_igpInstallers, bmgBsaManager, uitUiUtilities);
		}
	}
}
